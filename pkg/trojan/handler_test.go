package trojan_test

import (
	"bytes"
	"context"
	"encoding/binary"
	"hash/crc32"
	"testing"
	"time"

	"github.com/ethersphere/bee/pkg/swarm"
	"github.com/ethersphere/bee/pkg/trojan"
)

// Implements trojan.Decoder
type fooWrapper struct {
}

// Encode appends valid crc32 of topic + payload.
func (fw *fooWrapper) Encode(topic trojan.Topic, payload []byte) ([]byte, error) {
	bytesToSum := append(topic[:], payload...)
	sum := crc32.Checksum(bytesToSum, crc32.IEEETable)
	sumBytes := make([]byte, 4)
	binary.LittleEndian.PutUint32(sumBytes, sum)
	return append(bytesToSum, sumBytes...), nil
}

// Decode verifies the topic + payload of given data has valid crc32 at the end,
// as prepared by Encode above.
func (fw *fooWrapper) Decode(b []byte) (*trojan.Envelope, bool) {
	if len(b) < trojan.TopicSize+4 {
		return nil, false
	}
	rightIndex := len(b) - 4
	potentialSumBytes := b[rightIndex:]
	sum := crc32.Checksum(b[:rightIndex], crc32.IEEETable)
	sumBytes := make([]byte, 4)
	binary.LittleEndian.PutUint32(sumBytes, sum)
	if !bytes.Equal(sumBytes, potentialSumBytes) {
		return nil, false
	}
	var topic trojan.Topic
	copy(topic[:], b[:trojan.TopicSize])
	return &trojan.Envelope{
		Topic:   topic,
		Payload: b[trojan.TopicSize:rightIndex],
	}, true
}

// Implements trojan.Handler
type chandler struct {
	gotC chan []byte
}

func newChandler() *chandler {
	return &chandler{
		gotC: make(chan []byte),
	}
}

func (c *chandler) Handle(b []byte) {
	c.gotC <- b
}

func (c *chandler) Get() <-chan []byte {
	return c.gotC
}

func TestFooWrapper(t *testing.T) {
	registry := trojan.NewRegistry()
	decoder := &fooWrapper{}
	registry.AddDecoder(decoder)

	handler := newChandler()
	var topic trojan.Topic
	topic[0] = 0x2a
	registry.AddHandlers(topic, handler)

	gotC := handler.Get()
	ctx, cancel := context.WithTimeout(context.Background(), time.Second)
	defer cancel()

	payload := []byte("foo")
	summedBytes, _ := decoder.Encode(topic, payload)

	// fake address for now, lazy...
	addrBytes := make([]byte, 32)
	addrBytes[0] = 0x0d

	go func() {
		ch := swarm.NewChunk(swarm.NewAddress(addrBytes), summedBytes)
		registry.Process(ch)
	}()

	var bytesToHandle []byte
	select {
	case bytesToHandle = <-gotC:
	case <-ctx.Done():
		t.Fatal(ctx.Err())
	}
	if !bytes.Equal(bytesToHandle, payload) {
		t.Fatalf("bytes mismatch; expected %x, got %x", summedBytes, bytesToHandle)
	}
}

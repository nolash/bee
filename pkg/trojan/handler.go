package trojan

import (
	"context"

	"github.com/ethersphere/bee/pkg/swarm"
)

// Decoder is checked for every message to check if matches any of the
// trojan message algorithms
type Decoder interface {
	Decode(mayBeTrojan []byte) (*Envelope, bool)
}

// Envelope is a convenice structure to wrap and topic and payload
type Envelope struct {
	Topic   Topic
	Payload []byte
}

// Bytes returns an envelope to a single byte vector.
func (e *Envelope) Bytes() []byte {
	return append(e.Topic[:], e.Payload...)
}

// Handler is a function to be executed for a particular topic
type Handler interface {
	Handle([]byte)
}

// Registry is responsible for executing all decoders on all received content chunks
// and handlers on all chunks that resolve to a topic and payload from the decoders.
// There may be any number of handlers per topic.
type Registry struct {
	decoders []Decoder
	handlers map[Topic][]Handler
}

// NewRegistry creates a new registry
func NewRegistry() *Registry {
	return &Registry{
		handlers: make(map[Topic][]Handler),
	}
}

// AddDecoder adds a decoder to be executed on content chunks.
func (r *Registry) AddDecoder(decoder Decoder) {
	r.decoders = append(r.decoders, decoder)
}

// AddHandlers adds handlers to be executed for a particular topic
func (r *Registry) AddHandlers(topic Topic, handler ...Handler) {
	r.handlers[topic] = append(r.handlers[topic], handler...)
}

// Process receives a content chunk, executes decoders and handlers when applicable.
func (r *Registry) Process(ch swarm.Chunk) {
	for _, d := range r.decoders {
		envelope, ok := d.Decode(ch.Data())
		if ok {
			for _, h := range r.handlers[envelope.Topic] {
				h.Handle(envelope.Payload)
			}
		}
	}
}

// Miner performs parallell mining of trojan chunk to a selection of targets.
type Miner struct {
	mineC chan swarm.Chunk
}

// Run executes a mining operation for the given payload and target.
func (m *Miner) Run(ctx context.Context, envelope *Envelope, targets Targets) (swarm.Chunk, error) {
	payload := envelope.Bytes()
	m.mineC = make(chan swarm.Chunk)
	doneC := make(chan struct{})
	for _, target := range targets {
		go func(target Target) {
			n := make([]byte, 32)
			ch := mine(n, payload)
			if targetMatches(target, ch.Address()) {
				m.mineC <- ch
				return
			}
			select {
			case <-ctx.Done():
				return
			case <-doneC:
				return
			default:
			}
		}(target)
	}
	select {
	case ch := <-m.mineC:
		close(doneC)
		return ch, nil
	case <-ctx.Done():
		return nil, ctx.Err()
	}

}

// PLACEHOLDER - whatever needed to match the target when mined goes here
func targetMatches(target Target, address swarm.Address) bool {
	return true
}

// PLACEHOLDER - whatever needed to mine goes here
func mine(nonce []byte, payload []byte) swarm.Chunk {
	tmpMockAddress := make([]byte, 32)
	return swarm.NewChunk(swarm.NewAddress(tmpMockAddress), []byte("bar"))
}

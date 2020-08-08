module github.com/ethersphere/bee

go 1.14

require (
	bazil.org/fuse v0.0.0-20160811212531-371fbbdaa898
	github.com/allegro/bigcache v0.0.0-20190218064605-e24eb225f156
	github.com/aristanetworks/goarista v0.0.0-20170210015632-ea17b1a17847
	github.com/beorn7/perks v1.0.1
	github.com/btcsuite/btcd v0.20.1-beta
	github.com/caarlos0/env v3.5.0+incompatible
	github.com/cespare/xxhash/v2 v2.1.1
	github.com/codahale/hdrhistogram v0.0.0-20161010025455-3a0bb77429bd // indirect
	github.com/coreos/go-semver v0.3.0
	github.com/davecgh/go-spew v1.1.1
	github.com/davidlazar/go-crypto v0.0.0-20200604182044-b73af7476f6c // indirect
	github.com/deckarep/golang-set v0.0.0-20180603214616-504e848d77ea
	github.com/edsrzf/mmap-go v0.0.0-20160512033002-935e0e8a636c
	github.com/elastic/gosigar v0.0.0-20180330100440-37f05ff46ffa
	github.com/ethereum/go-ethereum v1.9.2
	github.com/ethersphere/bmt v0.1.2
	github.com/ethersphere/swarm v0.5.7
	github.com/fatih/color v1.7.0
	github.com/fjl/memsize v0.0.0-20180418122429-ca190fb6ffbc
	github.com/gballet/go-libpcsclite v0.0.0-20190528105824-2fd9b619dd3c
	github.com/go-stack/stack v1.8.0
	github.com/gogo/protobuf v1.3.1
	github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e // indirect
	github.com/golang/mock v1.4.3 // indirect
	github.com/golang/protobuf v1.4.2
	github.com/golang/snappy v0.0.1
	github.com/gopherjs/gopherjs v0.0.0-20200217142428-fce0ec30dd00 // indirect
	github.com/gorilla/handlers v1.4.2
	github.com/gorilla/mux v1.7.4
	github.com/gorilla/websocket v1.4.2
	github.com/hashicorp/golang-lru v0.5.4
	github.com/huin/goupnp v1.0.0
	github.com/ipfs/go-cid v0.0.6
	github.com/ipfs/go-log/v2 v2.1.1 // indirect
	github.com/jackpal/go-nat-pmp v1.0.2
	github.com/jbenet/goprocess v0.1.4
	github.com/karalabe/usb v0.0.0-20190819132248-550797b1cad8
	github.com/kr/text v0.2.0 // indirect
	github.com/libp2p/go-buffer-pool v0.0.2
	github.com/libp2p/go-flow-metrics v0.0.3
	github.com/libp2p/go-libp2p v0.10.0
	github.com/libp2p/go-libp2p-autonat v0.3.0 // indirect
	github.com/libp2p/go-libp2p-autonat-svc v0.1.0
	github.com/libp2p/go-libp2p-circuit v0.3.0 // indirect
	github.com/libp2p/go-libp2p-core v0.6.0
	github.com/libp2p/go-libp2p-discovery v0.5.0 // indirect
	github.com/libp2p/go-libp2p-peerstore v0.2.6
	github.com/libp2p/go-libp2p-quic-transport v0.6.0
	github.com/libp2p/go-msgio v0.0.4
	github.com/libp2p/go-openssl v0.0.6 // indirect
	github.com/libp2p/go-tcp-transport v0.2.0
	github.com/libp2p/go-ws-transport v0.3.1
	github.com/libp2p/go-yamux v1.3.8 // indirect
	github.com/lucas-clemente/quic-go v0.17.1 // indirect
	github.com/marten-seemann/qtls v0.10.0 // indirect
	github.com/mattn/go-colorable v0.1.2
	github.com/mattn/go-isatty v0.0.8
	github.com/mattn/go-runewidth v0.0.6
	github.com/matttproud/golang_protobuf_extensions v1.0.1
	github.com/minio/sha256-simd v0.1.1
	github.com/mitchellh/mapstructure v1.3.2 // indirect
	github.com/mr-tron/base58 v1.2.0
	github.com/multiformats/go-multiaddr v0.2.2
	github.com/multiformats/go-multiaddr-dns v0.2.0
	github.com/multiformats/go-multihash v0.0.13
	github.com/multiformats/go-multistream v0.1.1
	github.com/multiformats/go-varint v0.0.5
	github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e // indirect
	github.com/olekukonko/tablewriter v0.0.0-20190409134802-7e037d187b0c
	github.com/onsi/ginkgo v1.13.0 // indirect
	github.com/opentracing/opentracing-go v1.1.0
	github.com/pborman/uuid v0.0.0-20170112150404-1b00554d8222
	github.com/pelletier/go-toml v1.8.0 // indirect
	github.com/peterh/liner v0.0.0-20190123174540-a2c9a5303de7
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.7.1
	github.com/prometheus/client_model v0.2.0
	github.com/prometheus/common v0.10.0
	github.com/prometheus/procfs v0.1.3
	github.com/prometheus/tsdb v0.10.0
	github.com/rjeczalik/notify v0.9.1
	github.com/rnsdomains/rns-go-lib v0.0.0-20191114120302-3505575b0b8f
	github.com/robertkrimen/otto v0.0.0-20170205013659-6a77b7cbc37d
	github.com/rs/cors v0.0.0-20160617231935-a62a804a8a00
	github.com/rs/xhandler v0.0.0-20170707052532-1eb70cf1520d
	github.com/sirupsen/logrus v1.6.0
	github.com/smartystreets/assertions v1.1.1 // indirect
	github.com/spf13/afero v1.3.1 // indirect
	github.com/spf13/cast v1.3.1 // indirect
	github.com/spf13/cobra v1.0.0
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/spf13/viper v1.7.0
	github.com/status-im/keycard-go v0.0.0-20190316090335-8537d3370df4
	github.com/steakknife/bloomfilter v0.0.0-20180922174646-6819c0d2a570
	github.com/steakknife/hamming v0.0.0-20180906055917-c99c65617cd3
	github.com/syndtr/goleveldb v1.0.1-0.20190923125748-758128399b1d
	github.com/tyler-smith/go-bip39 v0.0.0-20181017060643-dbb3b84ba2ef
	github.com/uber/jaeger-client-go v2.24.0+incompatible
	github.com/uber/jaeger-lib v2.2.0+incompatible
	github.com/wsddn/go-ecdh v0.0.0-20161211032359-48726bab9208
	gitlab.com/nolash/go-mockbytes v0.0.7
	go.opencensus.io v0.22.4
	go.uber.org/atomic v1.6.0
	go.uber.org/zap v1.15.0 // indirect
	golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9
	golang.org/x/lint v0.0.0-20200302205851-738671d3881b // indirect
	golang.org/x/mod v0.3.0 // indirect
	golang.org/x/net v0.0.0-20200625001655-4c5254603344
	golang.org/x/sync v0.0.0-20200625203802-6e8e738ad208
	golang.org/x/sys v0.0.0-20200625212154-ddb9806d33ae
	golang.org/x/text v0.3.3
	golang.org/x/tools v0.0.0-20200626171337-aa94e735be7f // indirect
	google.golang.org/protobuf v1.25.0
	gopkg.in/check.v1 v1.0.0-20200227125254-8fa46927fb4f // indirect
	gopkg.in/ini.v1 v1.57.0 // indirect
	gopkg.in/sourcemap.v1 v1.0.5
	gopkg.in/urfave/cli.v1 v1.20.0
	gopkg.in/yaml.v3 v3.0.0-20200615113413-eeeca48fe776 // indirect
	honnef.co/go/tools v0.0.1-2020.1.4 // indirect
	resenje.org/web v0.4.3
)

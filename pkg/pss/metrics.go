// Copyright 2020 The Swarm Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package pss

import (
	m "github.com/ethersphere/bee/pkg/metrics"
	"github.com/prometheus/client_golang/prometheus"
)

type metrics struct {
	// all metrics fields must be exported
	// to be able to return them by Metrics()
	// using reflection

	TotalMessagesSentCounter prometheus.Counter
}

func newMetrics() metrics {
	subsystem := "pss"

	return metrics{
		TotalMessagesSentCounter: prometheus.NewCounter(prometheus.CounterOpts{
			Namespace: m.Namespace,
			Subsystem: subsystem,
			Name:      "total_message_sent",
			Help:      "Total messages sent.",
		}),
	}
}

func (s *Pss) Metrics() []prometheus.Collector {
	return m.PrometheusCollectorsFromFields(s.metrics)
}
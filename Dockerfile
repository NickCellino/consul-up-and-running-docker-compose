ARG ENVOY_IMAGE=envoyproxy/envoy:v1.24.1
ARG CONSUL_IMAGE=hashicorp/consul:1.15.3

FROM ${ENVOY_IMAGE} as envoy-bin

FROM ${CONSUL_IMAGE} as consul-bin

FROM ubuntu 

RUN apt-get update && \
    apt-get install -y \
      bash \
      curl \
      jq && \
    rm -rf /var/lib/apt/lists/*

COPY --from=envoy-bin /usr/local/bin/envoy /bin/envoy
COPY --from=consul-bin /bin/consul /bin/consul

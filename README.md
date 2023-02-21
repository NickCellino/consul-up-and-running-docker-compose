# Consul Service Mesh Birdwatcher Example with Docker Compose

This repo contains a docker-compose setup for running the Birdwatcher example from
Chapter 3 of "Consul: Up & Running".

NOTE: I've built this example to run on an M1 Macbook and currently, the `make install` step below is
hard-coded to build ARM64 binaries.

To run this example, clone the repo and run these commands from cloned directory:
```
# Clone birdwatcher repo and builds binaries for Linux ARM64
make install

# Run the docker-compose cluster
make run

# In a separate terminal, run this script to configure Consul
./configure_consul.sh

# All set! You can check out the following in your browser:
# Consul UI: localhost:8500
# Birdwatcher app: localhost:8080
```

This has been adapted from this example hashicups setup: https://github.com/hashicorp-demoapp/hashicups-setups/tree/main/docker-compose-consul.

## Note

As it stands, the Envoy proxies will not automatically emit traces until they are restarted. This is because
the necessary configs are in the proxy-defaults.hcl file which are not setup until after the cluster is running.

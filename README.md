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

# All set! You can check out the following in your browser:
# Consul UI: localhost:8500
# Birdwatcher app: localhost:8080
```

This has been adapted from this example hashicups setup: https://github.com/hashicorp-demoapp/hashicups-setups/tree/main/docker-compose-consul.

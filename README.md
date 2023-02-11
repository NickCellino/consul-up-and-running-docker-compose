# Consul Service Mesh Birdwatcher Example on M1 Mac

This repo contains a docker-compose setup for running the Birdwatcher example from
Chapter 3 of "Consul: Up & Running"

To run this example, clone the repo and run these commands from cloned directory:
```
# Clone birdwatcher repo and builds binaries for Linux ARM64
make install

# Run the docker-compose cluster
make run
```

This has been adapted from this example hashicups setup: https://github.com/hashicorp-demoapp/hashicups-setups/tree/main/docker-compose-consul.

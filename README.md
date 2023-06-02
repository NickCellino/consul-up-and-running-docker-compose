# Consul Service Mesh Birdwatcher Example with Docker Compose

## Getting Started

This repo contains a docker-compose setup for running the Birdwatcher example from
Chapter 3 of "Consul: Up & Running".

To run this example, clone the repo and run these commands from cloned directory:
```
# Clone birdwatcher repo and builds binaries
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

### Note

As it stands, the Envoy proxies will not automatically emit traces until they are restarted. This is because
the necessary configs are in the proxy-defaults.hcl file which are not setup until after the cluster is running.

## Connecting to HCP

**Note:** At the time of this writing (6/2/2023), linking existing non-k8s clusters to HCP is in Beta and not accessible to everyone yet. When it is, you can follow these instructions to link your cluster to HCP.

1. Follow the instructions [here](https://developer.hashicorp.com/hcp/docs/consul/usage/management-plane#link-self-managed-clusters-to-hcp) to initialize a self-managed Consul cluster in HCP. Select "link an existing self-managed cluster" and for Consul server agent runtime, select "virtual machine".
2. Note the provided JSON configuration snippet. Convert this to HCL and copy it into `./consul_config/server_config_0.hcl`.
3. Follow the instructions above in [Getting Started](#getting-started) to start your server or if your cluster is already running, run `make restart`. You should now see your cluster show up in HCP.

#!/usr/bin/env bash

docker-compose exec consul_server_0 consul config write /root/config_entries/proxy-defaults.hcl
docker-compose exec consul_server_0 consul config write /root/config_entries/ingress-gateway.hcl
docker-compose exec consul_server_0 consul config write /root/config_entries/deny-all-service-intentions.hcl
docker-compose exec consul_server_0 consul config write /root/config_entries/backend-service-intentions.hcl
docker-compose exec consul_server_0 consul config write /root/config_entries/frontend-service-intentions.hcl
docker-compose exec consul_server_0 consul config write /root/config_entries/backend-service-resolver.hcl
docker-compose exec consul_server_0 consul config write /root/config_entries/backend-service-splitter.hcl


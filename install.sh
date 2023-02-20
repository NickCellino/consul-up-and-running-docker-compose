#!/bin/bash

mkdir -p /opt/consul
echo "Starting Consul..."
nohup consul agent -config-dir=/config/ >/tmp/consul.out 2>&1 &

if [ $SERVICE == "igw" ]; then
  sleep 45
  consul config write /root/proxy-defaults.hcl
  consul config write /root/ingress-gateway.hcl
  consul config write /root/deny-all-service-intentions.hcl
  consul config write /root/backend-service-intentions.hcl
  consul config write /root/frontend-service-intentions.hcl

  echo "Starting Envoy Internet Gateway..."
  consul connect envoy \
    -gateway ingress \
    -service ingress-gatway \
    -admin-bind $ENVOY_ADMIN_BIND_ADDR \
    -address 127.0.0.1:20000
fi

sleep 50
echo "Starting Envoy..."
nohup consul connect envoy -sidecar-for $SERVICE -admin-bind $ENVOY_ADMIN_BIND_ADDR >/tmp/envoy.out 2>&1 &
sleep 5

if [ $SERVICE == "frontend" ]; then
  echo "Starting frontend"
  ./bin/frontend
fi

if [ $SERVICE == "backend" ]; then
  echo "Starting backend"
  ./bin/backend
fi


#!/bin/bash

mkdir -p /opt/consul
echo "Starting Consul..."
nohup consul agent -config-dir=/config/ >/tmp/consul.out 2>&1 &
sleep 5

if [ $SERVICE != "igw" ]; then
  echo "Starting Envoy..."
  nohup consul connect envoy -sidecar-for $SERVICE -admin-bind $ENVOY_ADMIN_BIND_ADDR >/tmp/envoy.out 2>&1 &
  sleep 5
else
  echo "Starting Envoy Internet Gateway..."
  consul connect envoy \
    -gateway ingress \
    -service ingress-gatway \
    -admin-bind $ENVOY_ADMIN_BIND_ADDR \
    -address 127.0.0.1:20000
  sleep 5
fi


if [ $SERVICE == "frontend" ]; then
  echo "Starting frontend"
  ./bin/frontend
fi

if [ $SERVICE == "backend" ]; then
  echo "Starting backend"
  ./bin/backend
fi


#!/bin/sh

mkdir -p /opt/consul
echo "Starting Consul..."
nohup consul agent -config-dir=/config/ >/tmp/consul.out 2>&1 &
sleep 5

if [ $SERVICE == "frontend" ]; then
  echo "Starting frontend"
  ./bin/frontend
fi

if [ $SERVICE == "backend" ]; then
  echo "Starting backend"
  ./bin/backend
fi


#!/bin/sh

mkdir -p /opt/consul
#echo "Starting Consul..."
#consul agent -config-dir=/config/

if [ $SERVICE == "frontend" ]; then
  echo "Starting frontend"
  ./bin/frontend
fi

if [ $SERVICE == "backend" ]; then
  echo "Starting backend"
  ./bin/backend
fi


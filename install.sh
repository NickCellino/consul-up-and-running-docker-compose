#!/bin/sh

mkdir -p /opt/consul
echo "Starting Consul..."
consul agent -config-dir=/config/


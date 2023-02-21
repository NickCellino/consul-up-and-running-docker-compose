#!/usr/bin/env bash

consul config write ./config_entries/proxy-defaults.hcl
consul config write ./config_entries/ingress-gateway.hcl
consul config write ./config_entries/deny-all-service-intentions.hcl
consul config write ./config_entries/backend-service-intentions.hcl
consul config write ./config_entries/frontend-service-intentions.hcl
consul config write ./config_entries/backend-service-resolver.hcl
consul config write ./config_entries/backend-service-splitter.hcl


data_dir = "/tmp/"
log_level = "DEBUG"
node_name = "consul-server-0"
datacenter = "dc1"

server = true
bootstrap_expect = 1

connect {
  enabled = true
}

ports {
  grpc = 8502
}

ui_config {
  enabled = true
  metrics_provider = "prometheus"
  metrics_proxy {
    base_url = "http://prometheus:9090"
  }
}

client_addr = "0.0.0.0"
bind_addr = "0.0.0.0"

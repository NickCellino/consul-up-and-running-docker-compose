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
}

client_addr = "0.0.0.0"
bind_addr = "0.0.0.0"

datacenter = "dc1"
data_dir =  "/opt/consul"
log_level = "DEBUG"

node_name = "backend-v2"
retry_join = [
  "consul_server_0",
]

ports {
  grpc = 8502
}

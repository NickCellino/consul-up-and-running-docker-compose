service {
  name = "frontend"
  port = 8081

  meta {
    version = "v1"
    prometheus_port = "20200"
  }

  connect {
    sidecar_service {
      port = 21000
      proxy {
        upstreams = [
          {
            destination_name = "backend"
            local_bind_port = 6001
          }
        ]
        config {
          envoy_prometheus_bind_addr = "0.0.0.0:20200"
        }
      }
    }
  }
}

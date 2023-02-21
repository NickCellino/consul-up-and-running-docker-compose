service {
  name = "backend"
  port = 7080

  meta {
    version = "v2"
    prometheus_port = "20200"
  }

  connect {
    sidecar_service {
      port = 22000
      proxy {
        config {
          envoy_prometheus_bind_addr = "0.0.0.0:20200"
        }
      }
    }
  }

  checks = [
    {
      name = "Health endpoint"
      http = "http://localhost:7080/healthz"
      interval = "10s"
      timeout = "1s"
    }
  ]
}

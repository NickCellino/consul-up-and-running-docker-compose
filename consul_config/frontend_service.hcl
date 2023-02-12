service {
  name = "frontend"
  port = 8081

  meta {
    version = "v1"
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
      }
    }
  }
}

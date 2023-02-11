service {
  name = "backend"
  port = 7080

  meta {
    version = "v1"
  }

  connect {
    sidecar_service {
      port = 22000
    }
  }
}

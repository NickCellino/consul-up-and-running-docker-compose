Kind = "service-router"
Name = "backend"
Routes = [
  {
    Destination = {
      RequestTimeout = "1s"
      NumRetries = 5
      RetryOnStatusCodes = [503]
    }
  }
]

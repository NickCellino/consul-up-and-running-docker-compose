Kind = "service-splitter"
Name = "backend"
Splits = [
  {
    Weight = 0,
    ServiceSubset = "v1"
  },
  {
    Weight = 100,
    ServiceSubset = "v2"
  }
]

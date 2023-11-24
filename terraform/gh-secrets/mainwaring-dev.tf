variable "PORT" {
  type = number
}

resource "gh-secrets_value" "PORT" {
  repo  = "theaccordance/card-dealer"
  name  = "PORT"
  value = var.PORT
}

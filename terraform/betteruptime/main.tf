variable "betteruptime_api_key" {
  type = string
}

provider "betteruptime" {
  # `api_token` can be omitted if BETTERUPTIME_API_TOKEN env var is set.
  api_token = var.betteruptime_api_key
}

terraform {
  required_version = "~> 1.0.3"
  required_providers {
    betteruptime = {
      source  = "BetterStackHQ/better-uptime"
      version = "0.3.12"
    }
  }
}

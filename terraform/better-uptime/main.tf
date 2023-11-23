variable "betteruptime_api_key" {
  type = string
}

provider "betteruptime" {
  # `api_token` can be omitted if BETTERUPTIME_API_TOKEN env var is set.
  api_token = var.betteruptime_api_key
}

terraform {
  required_providers {
    betteruptime = {
      source  = "BetterStackHQ/better-uptime"
      version = "0.3.20"
    }
  }
  cloud {
    organization = "mainwaring"

    workspaces {
      name = "better-uptime"
    }
  }
}

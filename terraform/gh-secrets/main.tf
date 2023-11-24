terraform {
  required_providers {
    gh-secrets = {
      source = "Koroutine/gh-secrets"
      version = "1.0.3"
    }
  }
  cloud {
    organization = "mainwaring"

    workspaces {
      name = "gh-secrets"
    }
  }
}

provider "gh-secrets" {
  token = var.github_token # or GITHUB_TOKEN
}

variable "github_token" {
  type = string
}

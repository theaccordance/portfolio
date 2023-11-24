terraform {
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

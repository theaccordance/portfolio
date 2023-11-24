variable "ADMIN_JWT_SECRET" {
  type = string
}

variable "API_TOKEN_SALT" {
  type = string
}

variable "APP_KEYS" {
  type = string
}

variable "CLOUDINARY_KEY" {
  type = string
}

variable "CLOUDINARY_NAME" {
  type = string
}

variable "CLOUDINARY_SECRET" {
  type = string
}

variable "DIGITALOCEAN_ACCESS_TOKEN" {
  type = string
}

variable "DIGITALOCEAN_APP_ID" {
  type = string
}

variable "DISCOGS_PAT" {
  type = string
}

variable "HOST" {
  type = string
}

variable "JWT_SECRET" {
  type = string
}

variable "NODE_ENV" {
  type = string
}

variable "PORT" {
  type = number
}

variable "POSTGRES_CERT" {
  type = string
}

variable "POSTGRES_HOST" {
  type = string
}

variable "POSTGRES_PASSWORD" {
  type = string
}

variable "POSTGRES_PORT" {
  type = number
}

variable "POSTGRES_USER" {
  type = string
}

variable "PUBLIC_URL" {
  type = string
}

resource "gh-secrets_value" "ADMIN_JWT_SECRET" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "ADMIN_JWT_SECRET"
  value = var.ADMIN_JWT_SECRET
}

resource "gh-secrets_value" "API_TOKEN_SALT" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "API_TOKEN_SALT"
  value = var.API_TOKEN_SALT
}

resource "gh-secrets_value" "APP_KEYS" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "APP_KEYS"
  value = var.APP_KEYS
}

resource "gh-secrets_value" "CLOUDINARY_KEY" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "CLOUDINARY_KEY"
  value = var.CLOUDINARY_KEY
}

resource "gh-secrets_value" "CLOUDINARY_NAME" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "CLOUDINARY_NAME"
  value = var.CLOUDINARY_NAME
}

resource "gh-secrets_value" "CLOUDINARY_SECRET" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "CLOUDINARY_SECRET"
  value = var.CLOUDINARY_SECRET
}

resource "gh-secrets_value" "DIGITALOCEAN_ACCESS_TOKEN" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "DIGITALOCEAN_ACCESS_TOKEN"
  value = var.DIGITALOCEAN_ACCESS_TOKEN
}

resource "gh-secrets_value" "DIGITALOCEAN_APP_ID" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "DIGITALOCEAN_APP_ID"
  value = var.DIGITALOCEAN_APP_ID
}

resource "gh-secrets_value" "DISCOGS_PAT" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "DISCOGS_PAT"
  value = var.DISCOGS_PAT
}

resource "gh-secrets_value" "HOST" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "HOST"
  value = var.HOST
}

resource "gh-secrets_value" "JWT_SECRET" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "JWT_SECRET"
  value = var.JWT_SECRET
}

resource "gh-secrets_value" "NODE_ENV" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "NODE_ENV"
  value = var.NODE_ENV
}

resource "gh-secrets_value" "PORT" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "PORT"
  value = var.PORT
}

resource "gh-secrets_value" "POSTGRES_CERT" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "POSTGRES_CERT"
  value = var.POSTGRES_CERT
}

resource "gh-secrets_value" "POSTGRES_HOST" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "POSTGRES_HOST"
  value = var.POSTGRES_HOST
}

resource "gh-secrets_value" "POSTGRES_PASSWORD" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "POSTGRES_PASSWORD"
  value = var.POSTGRES_PASSWORD
}

resource "gh-secrets_value" "POSTGRES_PORT" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "POSTGRES_PORT"
  value = var.POSTGRES_PORT
}

resource "gh-secrets_value" "POSTGRES_USER" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "POSTGRES_USER"
  value = var.POSTGRES_USER
}

resource "gh-secrets_value" "PUBLIC_URL" {
  repo  = "theaccordance/mainwaring-dev"
  name  = "PUBLIC_URL"
  value = var.PUBLIC_URL
}

data "cloudflare_zone" "mainwaring-dev" {
  account_id = "59b7a4e3e14e05580982c8d9835bbdca"
  zone_id = "9fe22cdd8d5f79b964f6853b0623eb6b"
}

resource "cloudflare_record" "carrd-primary" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "carrd"
  value   = "23.21.157.88"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "carrd-secondary" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "carrd"
  value   = "23.21.234.173"
  type    = "A"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "api" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "api"
  value   = "api-mainwaring-dev-vt4kr.ondigitalocean.app"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "bruce" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "bruce"
  value   = "carrd.mainwaring.dev"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "charts" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "charts"
  value   = "cname.vercel-dns.com"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "contact" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "contact"
  value   = "carrd.mainwaring.dev"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "docs" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "docs"
  value   = "a210291553-hosting.gitbook.io"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "root" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "@"
  value   = "carrd.mainwaring.dev"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "dkim" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "sig1._domainkey"
  value   = "sig1.dkim.mainwaring.dev.at.icloudmailadmin.com"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "status" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "status"
  value   = "statuspage.betteruptime.com"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "www" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "www"
  value   = "mainwaring.dev"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "mx-primary" {
  zone_id  = data.cloudflare_zone.mainwaring-dev.id
  name     = "mainwaring.dev"
  value    = "mx01.mail.icloud.com"
  type     = "MX"
  ttl      = 3600
  priority = 10
  proxied  = false
}

resource "cloudflare_record" "mx-secondary" {
  zone_id  = data.cloudflare_zone.mainwaring-dev.id
  name     = "mainwaring.dev"
  value    = "mx02.mail.icloud.com"
  type     = "MX"
  ttl      = 3600
  priority = 10
  proxied  = false
}

resource "cloudflare_record" "txt" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "mainwaring.dev"
  value   = "apple-domain=6uWpFsyf8zQQK7q5"
  type    = "TXT"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "spf" {
  zone_id = data.cloudflare_zone.mainwaring-dev.id
  name    = "mainwaring.dev"
  value   = "v=spf1 include:icloud.com ~all"
  type    = "TXT"
  ttl     = 3600
  proxied = false
}

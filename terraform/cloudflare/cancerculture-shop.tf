data "cloudflare_zone" "cancerculture-shop" {
  account_id = "59b7a4e3e14e05580982c8d9835bbdca"
  zone_id    = "896fef355b19949ca429a79f237e927c"
}

resource "cloudflare_record" "cc-mx-primary" {
  zone_id  = data.cloudflare_zone.cancerculture-shop.id
  name     = "cancerculture.shop"
  value    = "mx01.mail.icloud.com"
  type     = "MX"
  ttl      = 3600
  priority = 10
  proxied  = false
}

resource "cloudflare_record" "cc-mx-secondary" {
  zone_id  = data.cloudflare_zone.cancerculture-shop.id
  name     = "cancerculture.shop"
  value    = "mx02.mail.icloud.com"
  type     = "MX"
  ttl      = 3600
  priority = 10
  proxied  = false
}

resource "cloudflare_record" "cc-txt" {
  zone_id = data.cloudflare_zone.cancerculture-shop.id
  name    = "cancerculture.shop"
  value   = "apple-domain=uOUiXzmDvf2SMXqJ"
  type    = "TXT"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "cc-spf" {
  zone_id = data.cloudflare_zone.cancerculture-shop.id
  name    = "cancerculture.shop"
  value   = "v=spf1 include:icloud.com ~all"
  type    = "TXT"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_record" "cc-dkim" {
  zone_id = data.cloudflare_zone.cancerculture-shop.id
  name    = "sig1._domainkey"
  value   = "sig1.dkim.cancerculture.store.at.icloudmailadmin.com"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

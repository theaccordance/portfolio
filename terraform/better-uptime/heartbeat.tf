resource "betteruptime_heartbeat" "strapi-cron-dev" {
  grace  = 300
  name   = "Strapi Cron: Fetch Dev.to articles"
  period = 86400
}

resource "betteruptime_heartbeat" "strapi-cron-discogs" {
  grace  = 300
  name   = "Strapi Cron: Fetch Discogs data"
  period = 86400
}

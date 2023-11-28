resource "betteruptime_status_page" "status" {
  company_name  = "Mainwaring.dev"
  company_url   = "https://mainwaring.dev"
  subdomain     = "uncanny-panther"
  timezone      = "Central Time (US & Canada)"
  custom_domain = "status.mainwaring.dev"
  design        = "v2"
  layout        = "horizontal"
  theme         = "dark"
  #  logo_url      = "https://uptime-storage.s3.amazonaws.com/logos/cc077a63da5837eda8bc612d2735ff21.png"
}

resource "betteruptime_status_page_section" "websites" {
  status_page_id = betteruptime_status_page.status.id
  name           = "Websites"
  position       = 0
}

resource "betteruptime_status_page_section" "apps" {
  status_page_id = betteruptime_status_page.status.id
  name           = "Applications"
  position       = 1
}

resource "betteruptime_status_page_section" "processes" {
  status_page_id = betteruptime_status_page.status.id
  name           = "Processes"
  position       = 2
}

resource "betteruptime_status_page_resource" "website-contact" {
  status_page_id         = betteruptime_status_page.status.id
  status_page_section_id = betteruptime_status_page_section.websites.id
  resource_type          = "Monitor"
  resource_id            = betteruptime_monitor.website-contact.id
  public_name            = "Contact Page"
  widget_type            = "history"
}

resource "betteruptime_status_page_resource" "app-api" {
  status_page_id         = betteruptime_status_page.status.id
  status_page_section_id = betteruptime_status_page_section.apps.id
  resource_type          = "Monitor"
  resource_id            = betteruptime_monitor.app-api.id
  public_name            = "Strapi Backend"
  widget_type            = "history"
}

resource "betteruptime_status_page_resource" "process-dev" {
  status_page_id         = betteruptime_status_page.status.id
  status_page_section_id = betteruptime_status_page_section.processes.id
  resource_type          = "Heartbeat"
  resource_id            = betteruptime_heartbeat.strapi-cron-dev.id
  public_name            = "Fetch articles from dev.to"
  widget_type            = "history"
}

resource "betteruptime_status_page_resource" "process-discogs" {
  status_page_id         = betteruptime_status_page.status.id
  status_page_section_id = betteruptime_status_page_section.processes.id
  resource_type          = "Heartbeat"
  resource_id            = betteruptime_heartbeat.strapi-cron-discogs.id
  public_name            = "Fetch vinyl collection from Discogs"
  widget_type            = "history"
}

resource "betteruptime_monitor" "app-api" {
  url          = "https://api.mainwaring.dev/"
  monitor_type = "status"
}

resource "betteruptime_monitor" "website-contact" {
  url          = "https://contact.mainwaring.dev"
  monitor_type = "status"
}



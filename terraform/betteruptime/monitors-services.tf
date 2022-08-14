## Production Environment
resource "betteruptime_monitor_group" "services" {
  name = "Application Services"
}

resource "betteruptime_monitor" "api" {
  url                 = "https://api.mainwaring.dev"
  monitor_type        = "status"
  monitor_group_id    = betteruptime_monitor_group.services.id
  pronounceable_name  = "API Server"
  check_frequency     = "300"
  confirmation_period = "300"
  email               = false
  call                = false
  sms                 = false
  push                = false
}

resource "betteruptime_monitor" "chartbrew_client" {
  url                 = "https://charts.mainwaring.dev"
  monitor_type        = "status"
  monitor_group_id    = betteruptime_monitor_group.services.id
  pronounceable_name  = "Charts UI"
  check_frequency     = "300"
  confirmation_period = "300"
  email               = false
  call                = false
  sms                 = false
  push                = false
}

resource "betteruptime_monitor" "chartbrew_server" {
  url                 = "https://charts-mainwaring-dev.herokuapp.com/"
  monitor_type        = "status"
  monitor_group_id    = betteruptime_monitor_group.services.id
  pronounceable_name  = "Charts Server"
  check_frequency     = "300"
  confirmation_period = "300"
  email               = false
  call                = false
  sms                 = false
  push                = false
}
resource "betteruptime_monitor" "pwa" {
  url                 = "https://pwa.mainwaring.dev"
  monitor_type        = "status"
  monitor_group_id    = betteruptime_monitor_group.services.id
  pronounceable_name  = "Progressive Web Application"
  check_frequency     = "300"
  confirmation_period = "300"
  email               = false
  call                = false
  sms                 = false
  push                = false
}
resource "betteruptime_monitor" "docs" {
  url                 = "https://docs.mainwaring.dev"
  monitor_type        = "status"
  monitor_group_id    = betteruptime_monitor_group.services.id
  pronounceable_name  = "Documentation Portal"
  check_frequency     = "300"
  confirmation_period = "300"
  email               = false
  call                = false
  sms                 = false
  push                = false
}

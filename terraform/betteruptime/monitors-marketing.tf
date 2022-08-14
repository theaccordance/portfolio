## Production Environment
resource "betteruptime_monitor_group" "marketing" {
  name = "Marketing Websites"
}

# Pings the health monitor endpoint
resource "betteruptime_monitor" "bruce" {
  url                 = "https://bruce.mainwaring.dev"
  monitor_type        = "status"
  monitor_group_id    = betteruptime_monitor_group.marketing.id
  pronounceable_name  = "The Legend of Bruce"
  check_frequency     = "300"
  confirmation_period = "300"
  email               = false
  call                = false
  sms                 = false
  push                = false
}

# Pings the health monitor endpoint
resource "betteruptime_monitor" "contact" {
  url                 = "https://contact.mainwaring.dev"
  monitor_type        = "status"
  monitor_group_id    = betteruptime_monitor_group.marketing.id
  pronounceable_name  = "Contact Page"
  check_frequency     = "300"
  confirmation_period = "300"
  email               = false
  call                = false
  sms                 = false
  push                = false
}

// RBAC provides a standardized way of granting, changing, 
// and revoking access when it comes to viewing and 
// modifying Grafana resources, such as dashboards, 
// reports, and administrative settings.
resource "grafana_role" "super_user" {
  name        = "Super User"
  description = "My Super User description"
  uid         = "superuseruid"
  version     = 1
  global      = true

  permissions {
    action = "org.users:add"
    scope  = "users:*"
  }
  permissions {
    action = "org.users:write"
    scope  = "users:*"
  }
  permissions {
    action = "org.users:read"
    scope  = "users:*"
  }
}
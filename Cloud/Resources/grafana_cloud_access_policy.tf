// Grafana Cloud Access Policies implement an authorization process for actions 
// requested on Grafana Mimir (metrics), Grafana Loki (logs), Grafana Tempo (traces), 
// and Grafana Cloud Alerts services, as well as for some Grafana Cloud API endpoints.
data "grafana_cloud_organization" "current" {
  slug = "<your org slug>"
}

resource "grafana_cloud_access_policy" "test" {
  region       = "us"
  name         = "my-policy"
  display_name = "My Policy"

  scopes = ["metrics:read", "logs:read"]

  realm {
    type       = "org"
    identifier = data.grafana_cloud_organization.current.id

    label_policy {
      selector = "{namespace=\"default\"}"
    }
  }
}

resource "grafana_cloud_access_policy_token" "test" {
  region           = "us"
  access_policy_id = grafana_cloud_access_policy.test.policy_id
  name             = "my-policy-token"
  display_name     = "My Policy Token"
  expires_at       = "2023-01-01T00:00:00Z"
}
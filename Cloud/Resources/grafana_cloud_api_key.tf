// Manages a single API key on the Grafana Cloud portal (on the organization level)
resource "grafana_cloud_api_key" "test" {
  cloud_org_slug = "myorg"
  name           = "my-key"
  role           = "Admin"
}
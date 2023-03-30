//Creating a Grafana provider
provider "grafana" {
  url  = "http://grafana.example.com/"
  auth = var.grafana_auth
}
// Reporting enables you to automatically 
// generate PDFs from any of your dashboards 
// and have Grafana email them to interested 
// parties on a schedule. 
resource "grafana_dashboard" "test" {
  config_json = <<EOD
{
  "title": "Dashboard for report",
  "uid": "report"
}
EOD
  message     = "inital commit."
}

resource "grafana_report" "test" {
  name          = "my report"
  dashboard_uid = grafana_dashboard.test.uid
  recipients    = ["some@email.com"]
  schedule {
    frequency = "hourly"
  }
}
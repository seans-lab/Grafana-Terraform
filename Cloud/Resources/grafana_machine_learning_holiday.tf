// A holiday describes time periods where a time series is expected to behave differently to normal.
resource "grafana_machine_learning_job" "test_job" {
  // ...
  holidays = [
    grafana_machine_learning_holiday.my_holiday.id
  ]
}
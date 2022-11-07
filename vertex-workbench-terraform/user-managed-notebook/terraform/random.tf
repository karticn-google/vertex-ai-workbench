##Generate Random ID##

resource "random_string" "project_random_string" {
  length = 8
  lower = true
  special = false
  upper = false
}
##Local Variables##

locals {
  generated_bucket_name = "${var.project_id}-${random_string.project_random_string.id}"
}

locals {
  generated_project_id = "${var.project_id}-${random_string.project_random_string.id}"
}
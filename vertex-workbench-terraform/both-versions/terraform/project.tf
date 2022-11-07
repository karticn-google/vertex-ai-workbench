##Create Project##

resource "google_project" "vertex_ai_project" {
  name            = local.generated_project_id
  project_id      = local.generated_project_id
  billing_account = var.billing_account
  org_id          = var.org_id
  timeouts {
    create = "15m"
  }
}

resource "time_sleep" "sleep_after_create_project" {
  create_duration = "120s"
  depends_on = [
    google_project.vertex_ai_project
  ]
}
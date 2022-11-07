##Create Service Account##
resource "google_service_account" "vai_service_account" {
  project      = local.generated_project_id
  account_id   = var.service_account_name
  display_name = var.service_account_name
  depends_on = [
    google_project.vertex_ai_project,
    time_sleep.sleep_after_api_enabling,
    time_sleep.sleep_after_org_policy_updates
  ]
}

##Create Project IAM Member##
resource "google_project_iam_member" "vai_project_iam_member" {
  project = local.generated_project_id
  for_each = toset(var.iam_permissions)
  role = each.key
  member  = "serviceAccount:${google_service_account.vai_service_account.email}"
  depends_on = [
    google_project.vertex_ai_project,
    time_sleep.sleep_after_api_enabling,
    time_sleep.sleep_after_org_policy_updates
  ]
}
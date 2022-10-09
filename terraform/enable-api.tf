##Enable APIs##

resource "google_project_service" "enable_orgpolicy_google_apis" {
  project = local.generated_project_id
  service = "orgpolicy.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_compute_google_apis" {
  project = local.generated_project_id
  service = "compute.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_container_google_apis" {
  project = local.generated_project_id
  service = "container.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_containerregistry_google_apis" {
  project = local.generated_project_id
  service = "containerregistry.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_dataproc_google_apis" {
  project = local.generated_project_id
  service = "dataproc.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_bigquery_google_apis" {
  project = local.generated_project_id
  service = "bigquery.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_storage_google_apis" {
  project = local.generated_project_id
  service = "storage.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_notebooks_google_apis" {
  project = local.generated_project_id
  service = "notebooks.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_aiplatform_google_apis" {
  project = local.generated_project_id
  service = "aiplatform.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_logging_google_apis" {
  project = local.generated_project_id
  service = "logging.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}

resource "google_project_service" "enable_monitoring_google_apis" {
  project = local.generated_project_id
  service = "monitoring.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}
resource "google_project_service" "enable_servicenetworking_google_apis" {
  project = local.generated_project_id
  service = "servicenetworking.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}
resource "google_project_service" "enable_artifactregistry_google_apis" {
  project = local.generated_project_id
  service = "artifactregistry.googleapis.com"
  disable_dependent_services = true
  depends_on = [
    google_project.vertex_ai_project
  ]
}


##Sleep for 3 minutes since enable api takes some time to reflect##

resource "time_sleep" "sleep_after_api_enabling" {
  create_duration = "180s"
  depends_on = [
    google_project_service.enable_orgpolicy_google_apis,
    google_project_service.enable_compute_google_apis,
    google_project_service.enable_container_google_apis,
    google_project_service.enable_containerregistry_google_apis,
    google_project_service.enable_dataproc_google_apis,
    google_project_service.enable_bigquery_google_apis,
    google_project_service.enable_storage_google_apis,
    google_project_service.enable_servicenetworking_google_apis,
    google_project_service.enable_aiplatform_google_apis,
    google_project_service.enable_notebooks_google_apis
  ]
}

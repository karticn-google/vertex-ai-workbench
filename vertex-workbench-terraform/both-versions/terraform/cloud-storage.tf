##Create GCS Bucket##

resource "google_storage_bucket" "vai_managed_notebook_bucket_creation" {
  project                           = local.generated_project_id
  name                              = "${var.vai_bucket_name}${random_string.project_random_string.id}"
  location                          = var.cloud_region
  uniform_bucket_level_access       = var.bucket_uniform_level_access
  force_destroy                     = var.bucket_force_destroy
  depends_on = [
    time_sleep.sleep_after_api_enabling
  ]
}

##Copy Artifacts from Local to GCS##

resource "google_storage_bucket_object" "scripts_upload_to_gcs" {
  for_each = fileset("${path.module}/scripts/", "*")
  source = "${path.module}/scripts/${each.value}"
  name = "${each.value}"
  bucket = "${var.vai_bucket_name}${random_string.project_random_string.id}"
  depends_on = [
    google_storage_bucket.vai_managed_notebook_bucket_creation,
    time_sleep.sleep_after_api_enabling 
    ]
}
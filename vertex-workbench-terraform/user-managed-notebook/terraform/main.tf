##Create Vertex AI User Managed Notebook##

resource "google_notebooks_instance" "user_managed_nb" {
  project = local.generated_project_id
  name = var.user_mananged_nb_name
  location = var.cloud_zone
  machine_type = var.machine_type
  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-ent-2-3-cu110-notebooks"
  }
  service_account = google_service_account.vai_service_account.email
  post_startup_script = "gs://${var.vai_bucket_name}${random_string.project_random_string.id}/notebook-startup.sh"
  install_gpu_driver = false
  boot_disk_type = "PD_SSD"
  boot_disk_size_gb = 100

  no_public_ip = false
  no_proxy_access = false

  network = google_compute_network.vai_vpc_network.id
  subnet = google_compute_subnetwork.vertexai_subnet.id
  depends_on = [
    time_sleep.sleep_after_org_policy_updates
  ]
}
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
  post_startup_script = "gs://${var.vai_managed_notebook_bucket_name}${random_string.project_random_string.id}/notebook-startup.sh"
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

##Create Vertex AI Managed Notebook##

resource "google_notebooks_runtime" "managed_nb" {
  project              = local.generated_project_id
  provider             = google-beta
  name                 = "${var.managed_nb_name}-${random_string.project_random_string.id}"
  location             = var.cloud_region
  access_config {
    access_type        = "SERVICE_ACCOUNT"
    runtime_owner      = google_service_account.vai_service_account.email
  }
  software_config {
    post_startup_script = "${google_storage_bucket.vai_managed_notebook_bucket_creation.url}/notebook-startup.sh"
    post_startup_script_behavior = "DOWNLOAD_AND_RUN_EVERY_START"
  }
  virtual_machine {
    virtual_machine_config {
      machine_type     = var.machine_type
      data_disk {
        initialize_params {
          disk_size_gb = "100"
          disk_type    = "PD_STANDARD"
        }
      }
      container_images {
        repository = "gcr.io/deeplearning-platform-release/tf-cpu"
        tag = "latest"
      }
    network = google_compute_network.vai_vpc_network.id
    subnet = google_compute_subnetwork.vertexai_subnet.id
    internal_ip_only = false
    }
  }
  depends_on = [
    time_sleep.sleep_after_api_enabling,
    google_compute_global_address.private_ip_alloc,
    google_service_networking_connection.snc
  ]
}
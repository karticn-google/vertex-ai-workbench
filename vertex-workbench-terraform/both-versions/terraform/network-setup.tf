##Create VPC##

resource "google_compute_network" "vai_vpc_network" {
  project                 = local.generated_project_id
  name                    = "${local.generated_project_id}-${var.vpc_name}"
  description             = "vpc network for vertex ai managed notebooks"
  auto_create_subnetworks = false
  mtu                     = 1460
  depends_on = [
    time_sleep.sleep_after_api_enabling,
    time_sleep.sleep_after_org_policy_updates,
    google_project.vertex_ai_project
  ]
}

##Create Subnet##

resource "google_compute_subnetwork" "vertexai_subnet" {
  project       = local.generated_project_id
  name          = "${local.generated_project_id}-${var.subnet_name}"
  ip_cidr_range = var.subnet_cidr
  region        = var.cloud_region
  network       = google_compute_network.vai_vpc_network.id
  depends_on = [
    google_compute_network.vai_vpc_network
  ]
}
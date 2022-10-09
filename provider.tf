##Terraform Google Beta Provider##
provider "google-beta" {
  region = var.cloud_region
}

##Terraform Local Provider##
provider "local" {}

##Terraform Google Provider##
provider "google" {
  region = var.cloud_region
}
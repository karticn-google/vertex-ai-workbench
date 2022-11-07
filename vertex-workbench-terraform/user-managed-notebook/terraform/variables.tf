variable "org_id" {
  type = string
  description = "Google Cloud Org ID"
}

variable "cloud_region" {
  type = string
  description = "google cloud region"
  default = "us-central1"
}

variable "project_id" {
  type = string
  description = "google cloud project id"
  default = "vertexai-demo"
}

variable "vpc_name" {
  type = string
  description = "name of the virtual private network"
  default = "vertex-ai-vpc-test"
}

variable "vpc_routing_mode" {
  type = string
  description = "vpc routing mode"
  default = "REGIONAL"
}

variable "subnet_name" {
  type = string
  description = "name of subnet"
  default = "vertex-ai-subnet-test"
}

variable "subnet_cidr" {
  type = string
  description = "CIDR for subnet"
  default = "10.0.0.0/16"
}

variable "subnet_private_access" {
  type = bool
  description = "subnet private access"
  default = true
}

variable "vai_bucket_name" {
  type = string
  description = "bucket name"
  default = "vertex-ai-managed-nb"
}

variable "bucket_uniform_level_access" {
  type = bool
  default = true
}

variable "bucket_force_destroy" {
  type = bool
  default = true
}

variable "service_account_name" {
  type = string
  default = "vertex-ai-service-account"
}

variable "billing_account" {
  type = string
}

variable "user_mananged_nb_name" {
  type = string
  default = "user-managed-notebook"
}

variable "machine_type" {
  type = string
  default = "n1-standard-4"
}

variable "cloud_zone" {
  type = string
  default = "us-central1-a"
}

variable "iam_permissions" {
  type = list
}
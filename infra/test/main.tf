terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "test" {
  name     = "dummy-test"
  location = var.region
  count    = 0 # impede criação

  remove_default_node_pool = true
  initial_node_count       = 1
}

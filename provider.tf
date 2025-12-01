# provider file 

terraform {
  required_version = ">=1.13.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.8.0"

    }
  }
  backend "gcs" {
    bucket = "windy-album-477918-i6-terraform-state"
    prefix = "dev/gke-cluester-standard-private"

  }

}


provider "google" {
  project = var.project_name
  region  = var.location
}
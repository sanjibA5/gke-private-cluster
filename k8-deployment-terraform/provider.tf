terraform {
  required_version = ">=1.13.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.8.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
  backend "gcs" {
    bucket = "windy-album-477918-i6-terraform-state"
    prefix = "dev/k8-deployment-obj"
  }
}

provider "google" {
  project = var.project_name
  region  = var.location
}

# k8 provider to access the GKE 
provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth.0.cluster_ca_certificate
    # to converte base 64
  )
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "gke-gcloud-auth-plugin"
  }
}


data "terraform_remote_state" "gke_data_source" {
  backend = "gcs"
  config = {

    bucket = "windy-album-477918-i6-terraform-state"
    prefix = "dev/gke-cluester-standard-private"

  }


}

output "gke_cluster_name" {
  value = data.terraform_remote_state.gke_data_source.outputs.gke_master_name
}
output "gke_cluster_endpoint" {
  value = data.terraform_remote_state.gke_data_source.outputs.gke_master_end_point
}

# get the gke related data 

data "google_container_cluster" "my_cluster" {
  name     = data.terraform_remote_state.gke_data_source.outputs.gke_master_name
  location = var.location
}

output "gke_details" {

  value = {
    endpoint   = data.google_container_cluster.my_cluster.endpoint
    # cluster_ca = data.google_container_cluster.my_cluster.master_auth.0.cluster_ca_certificate
  }
}

data "google_client_config" "default" {

}
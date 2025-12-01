resource "google_compute_network" "my-vpc-custom-nw" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "my-sub-net" {
  name                     = "${local.name}-${var.location}-subnet"
  region                   = var.location
  ip_cidr_range            = var.sub_net_ip_range
  private_ip_google_access = true
  secondary_ip_range {
    range_name    = "kubernetis-pods-range"
    ip_cidr_range = var.pods_ip_range
  }
  secondary_ip_range {
    range_name    = "kubernetis-service-range"
    ip_cidr_range = var.services_ip_range
  }
  network = google_compute_network.my-vpc-custom-nw.id
}

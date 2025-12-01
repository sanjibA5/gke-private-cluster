# # cloud router 
resource "google_compute_router" "cloud-router" {
  name    = "cloud-router-for-${local.name}-${local.env}"
  network = google_compute_network.my-vpc-custom-nw.name
  region  = var.location
}


# # cloud nat 

resource "google_compute_router_nat" "cloud-nat" {
  name                               = "cloud-nat-for-${local.name}-${local.env}"
  router                             = google_compute_router.cloud-router.name
  region                             = google_compute_router.cloud-router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

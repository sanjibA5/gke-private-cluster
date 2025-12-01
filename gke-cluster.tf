resource "google_container_cluster" "gke" {
  name     = "${local.name}-gke"
  location = var.location
  # location = "us-central1-f"
  node_locations = data.google_compute_zones.name_zone.names
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  node_config {
    disk_size_gb = "20"
    disk_type    = "pd-standard"
  }
  #network
  network             = google_compute_network.my-vpc-custom-nw.self_link
  subnetwork          = google_compute_subnetwork.my-sub-net.self_link
  deletion_protection = false
  # private cluester config 
  private_cluster_config {
    # enable_private_endpoint = false
    enable_private_endpoint = true # to enable the private cluster only 
    master_ipv4_cidr_block  = var.master_ip_range
    enable_private_nodes    = true
  }

  ip_allocation_policy {
    # this is for pods ip 
    cluster_secondary_range_name = google_compute_subnetwork.my-sub-net.secondary_ip_range[0].range_name
    # this is for ip of services 
    services_secondary_range_name = google_compute_subnetwork.my-sub-net.secondary_ip_range[1].range_name
  }

  master_authorized_networks_config {
    cidr_blocks {
      # cidr_block   = "152.56.156.76/32"
      cidr_block   = "10.128.15.15/32"
      display_name = "internet"
      #  152.58.180.88
    }
  }

}
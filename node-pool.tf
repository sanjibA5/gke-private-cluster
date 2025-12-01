resource "google_container_node_pool" "node_pool" {
  name       = "${local.name}-node-pool-1"
  location   = var.location
  cluster    = google_container_cluster.gke.name
  node_count = 1

  node_config {
    # preemptible  = true
    machine_type = var.mechine_type
    # tags         = [tolist(google_compute_firewall.fw-ssh.target_tags)[0]]
    disk_size_gb = 20
    disk_type    = "pd-standard"


    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.service_account_gke.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  # cluster auto scaler config 
  autoscaling {
    min_node_count  = 1
    max_node_count  = 3
    location_policy = "ANY"
  }
}
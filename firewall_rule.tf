
resource "google_compute_firewall" "fw-ssh" {
  name = "${local.name}-fw-rule-allow-ssh-22"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  priority = 1000

  network = google_compute_network.my-vpc-custom-nw.id
  #   targe = [ "ssh-tag" ]
  target_tags = ["ssh-tag"]
  direction   = "INGRESS"
  # source_ranges = ["0.0.0.0/0"]
  source_ranges = ["35.235.240.0/20"] # this range is the IAP range to connect the VM 
}


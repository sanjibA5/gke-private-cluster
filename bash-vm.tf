# Resource Block: Reserver Internal IP Address for Bastion Host
resource "google_compute_address" "bastion_internal_ip" {
  name         = "${local.name}-bastion-internal-ip"
  description  = "Internal IP address reserved for Bastion VM"
  address_type = "INTERNAL"
  region       = var.location
  subnetwork   = google_compute_subnetwork.my-sub-net.id
  address      = "10.128.15.15" # Use subnet slicer to understand better https://www.davidc.net/sites/default/subnets/subnets.html
}


# this vm will exist iin same vpc and we will be able to connect the gke using this vm only 

resource "google_compute_instance" "my-vm" {
  name         = "bash-vm"
  machine_type = var.mechine_type
  zone         = "${var.location}-a"

  tags = [tolist(google_compute_firewall.fw-ssh.target_tags)[0]]

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-12"
      labels = {
        my_label = "value"
      }
    }
  }

  // Local SSD disk


  network_interface {
    network    = google_compute_network.my-vpc-custom-nw.name
    subnetwork = google_compute_subnetwork.my-sub-net.name
    network_ip = google_compute_address.bastion_internal_ip.address


  }


  metadata_startup_script = <<-EOT
  sudo apt update 
  sudo apt install  -y telnet
  sudo apt-get install  -y kubectl
  sudo apt-get  install google-cloud-cli -y 
  sudo apt upd ate 
  EOT


}
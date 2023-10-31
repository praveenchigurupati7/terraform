# Create two external IP addresses
resource "google_compute_address" "runner-ip" {
  count = var.counter
  name  = "runner-ip-${count.index + 1}"
}

resource "google_compute_instance" "default" {
  count = var.counter
  name         = "agent-${count.index + 1}"
  machine_type = var.gcp_machine_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.runner-ip[count.index].address
    }
  }

  tags = ["http-server", "https-server"]

  metadata_startup_script = file("startup-script.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }
}


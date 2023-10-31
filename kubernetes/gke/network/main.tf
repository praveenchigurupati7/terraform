# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https-traffic"
  network = google_compute_network.vpc.name

  source_ranges = ["0.0.0.0/0"]
  priority = "900"
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "9090", "30000-32767"]
  }
}
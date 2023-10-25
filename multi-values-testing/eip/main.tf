resource "google_compute_address" "eip" {
  count = var.eip_count
  name  = "eip-${count.index}"
  region = "us-central1"
}
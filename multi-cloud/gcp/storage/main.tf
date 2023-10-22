resource "google_storage_bucket" "multi-cloud-bucket" {
  name          = var.gcp_storage_bucket_name
  location      = var.gcp_storage_bucket_location
}
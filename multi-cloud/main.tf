module "gcp_compute" {
  source = "./gcp/compute"

  counter = var.counter
  gcp_zone = var.gcp_zone
  gcp_machine_type = var.gcp_machine_type
  service_account_email = var.service_account_email
}

module "aws_compute" {
  source = "./aws/compute"

  counter = var.counter
  aws_availability_zone = var.aws_availability_zone
  aws_instance_type = var.aws_instance_type
}

module "gcs" {
  source = "./gcp/storage"

  gcp_storage_bucket_name = var.gcp_storage_bucket_name
  gcp_storage_bucket_location = var.gcp_storage_bucket_location
}

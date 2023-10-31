module "gcp_compute" {
  source = "./gcp/compute"

  counter = var.counter
  gcp_zone = var.gcp_zone
  gcp_machine_type = var.gcp_machine_type
  service_account_email = var.service_account_email
}

# module "aws_compute" {
#   source = "./aws/compute"

#   counter = var.counter
#   aws_availability_zone = var.aws_availability_zone
#   aws_instance_type = var.aws_instance_type
# }

# module "gcs" {
#   source = "./gcp/storage"

#   gcp_storage_bucket_name = var.gcp_storage_bucket_name
#   gcp_storage_bucket_location = var.gcp_storage_bucket_location
# }

# data "template_file" "ansible_inventory" {
#   template = file("${path.module}/ansible_inventory.tpl")

#   vars = {
#     instance_name = module.gcp_compute.
#     instance_ip   = google_compute_instance.example.network_interface.0.access_config.0.assigned_nat_ip
#   }
# }

# resource "null_resource" "generate_ansible_inventory" {
#   triggers = {
#     always_run = "${timestamp()}"
#   }

#   provisioner "local-exec" {
#     command = <<EOT
#       echo '${data.template_file.ansible_inventory.rendered}' > ansible_inventory.ini
#     EOT
#   }
# }

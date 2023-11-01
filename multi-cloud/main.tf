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

resource "null_resource" "generate_ansible_inventory" {

  provisioner "local-exec" {
    command = <<EOT
      if [[ -f ./ansible_inventory.ini ]]; then
        rm -rf ./ansible_inventory.ini
        touch ./ansible_inventory.ini
      fi
      for instance in "${join("\n", module.gcp_compute.gcp_instance_info)}"; do
        echo "$instance\n" >> ansible_inventory.ini
      done
    EOT
  }
}

# resource "null_resource" "run_ansible_playbook" {

#   provisioner "local-exec" {
#     command = <<EOT
#       ansible-playbook -i ansible_inventory.ini ansible/playbook.yml
#     EOT
#   }
# }










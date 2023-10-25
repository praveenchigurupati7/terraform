variable "eip_count" {
  description = "Number of Elastic IPs to create"
  default     = 3
}

resource "google_compute_address" "eip" {
  count = var.eip_count
  name  = "eip-${count.index}"
  region = "us-central1"
}

# Store the EIPs in a list variable
# variable "eips" {
#   type    = list(object({
#     name   = string
#     address = string
#     region = string
#   }))
#   default = [
#     for eip in google_compute_address.eip :
#     {
#       name   = eip.name
#       address = eip.address
#       region = eip.region
#     }
#   ]
# }

locals {

  eips = [

    for eip in google_compute_address.eip :
    {
      name = eip.name
      address = eip.address
      region = eip.region
    }

  ]
}

# Output the EIPs
output "eips" {
  description = "List of Elastic IPs"
  value       = local.eips
}

variable "counter" {
  type    = number
  default = 1
}

variable "gcp_zone" {
  type = string
}

variable "gcp_machine_type" {
  type = string
}

# variable "gcp_storage_bucket_name" {
#   type = string
#   default = "multicloud-bucket-1988"
# }

# variable "gcp_storage_bucket_location" {
#   type = string
#   default = "US"
# }

variable "service_account_email" {
  type = string
  default = "terraform@elevated-glow-400716.iam.gserviceaccount.com"
}

# variable "aws_availability_zone" {
#   type = string
#   default = "us-east-1a"
# }

# variable "aws_instance_type" {
#   type = string
#   default = "t2.micro"
# }
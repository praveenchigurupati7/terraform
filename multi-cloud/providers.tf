
# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "5.22.0"
#     }
#   }
# }

# provider "aws" {
#   region = "us-east-1"
# }

provider "google" {
  project     = "elevated-glow-400716"
  region      = "us-central1"
}

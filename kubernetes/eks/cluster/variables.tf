variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "vpc_id" {
  type        = string
}

variable "private_subnets" {
  type        = list(string)
}

variable "cluster_name" {
  type        = string
}
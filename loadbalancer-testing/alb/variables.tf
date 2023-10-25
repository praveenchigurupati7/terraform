variable "list_of_ports" {
  type        = list(number)
  default     = [80, 81, 82]
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "aws_hosts" {
  type = list(string)
}
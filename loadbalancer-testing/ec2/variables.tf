variable "counter" {
  type        = number
}

variable "availability_zones" {
  type        = list(string)
}

variable "security_group_name" {
  type        = string
  default     = "windows_instance_SG"
}

variable "list_of_ports" {
  type        = map(number)
  default     = {
    website1  = 80
    website2  = 81
    website3  = 82
  }
}
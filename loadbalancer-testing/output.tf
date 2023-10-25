# output "ami_name" {
#   value = data.aws_ami.windows.id
# }

# output "az" {
#   value = data.aws_availability_zones.available.names
# }

# # output "subnets" {
# #   value = data.aws_subnets.example[*].id
# # }

# # output "vpc" {
# #   value = data.aws_vpc.default.id
# # }

# output "subnet_ids" {
#   value = [data.aws_subnets.selected.ids]
# }

output "instances_list" {
  value = module.aws_ec2.instance_ids
}
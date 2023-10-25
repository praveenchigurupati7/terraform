

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {
  default = true
} 

data "aws_subnets" "selected" {
  filter {
    name = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


module "aws_ec2" {
  source = "./ec2"

  counter = 3
  availability_zones = data.aws_availability_zones.available.names
} 


module "aws_alb" {
  source = "./alb"

  vpc_id = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.selected.ids
  aws_hosts = module.aws_ec2.instance_ids
}
































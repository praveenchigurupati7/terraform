output "vpc_id" {
  value       = module.ecs_network.vpc_id
}

output "private_subnets" {
  value       = module.ecs_network.private_subnets
}
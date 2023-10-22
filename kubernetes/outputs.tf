# output "region" {
#   value       = var.region
#   description = "GCloud Region"
# }

# output "project_id" {
#   value       = var.project_id
#   description = "GCloud Project ID"
# }

# output "kubernetes_cluster_name" {
#   value       = module.gke_cluster.kubernetes_cluster_name
#   description = "GKE Cluster Name"
# }

# output "kubernetes_cluster_host" {
#   value       = module.gke_cluster.kubernetes_cluster_host
#   description = "GKE Cluster Host"
# }
output "vpc_id" {
  value       = module.eks_network.vpc_id
}

output "private_subnets" {
  value       = module.eks_network.private_subnets
}

output "oidc_provider" {
  value       = replace(data.aws_eks_cluster.eks.identity.0.oidc.0.issuer, "https://", "")
}


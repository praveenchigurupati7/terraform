module "gke_network" {
  source = "./gke/network"

  project_id = var.project_id
  region = var.gcp_region
}

module "gke_cluster" {
  source = "./gke/cluster"

  project_id = var.project_id
  region = var.gcp_region
  network = module.gke_network.network
  subnetwork = module.gke_network.subnetwork
}

# locals {
#   cluster_name = "multicloud-cluster-${random_string.suffix.result}"
# }

# resource "random_string" "suffix" {
#   length  = 8
#   special = false
# }

# module "eks_network" {
#   source = "./eks/network"

#   cluster_name = local.cluster_name
# }

# module "eks_cluster" {
#   source = "./eks/cluster"

#   cluster_name = local.cluster_name
#   vpc_id = module.eks_network.vpc_id
#   private_subnets = module.eks_network.private_subnets
# }

# data "aws_eks_cluster" "eks" {
#   name = local.cluster_name
# }

# module "aws_eks_ebs_integration" {
#   source = "./eks/iam"

#   cluster_name = local.cluster_name
#   oidc_provider = replace(data.aws_eks_cluster.eks.identity.0.oidc.0.issuer, "https://", "")
# }
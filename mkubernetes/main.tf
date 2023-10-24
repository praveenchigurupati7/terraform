locals {
  cluster_name = "mkubernetes-cluster-${random_string.suffix.result}"
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "ecs_network" {
  source = "./network"

  cluster_name = local.cluster_name
}
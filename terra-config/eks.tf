resource "aws_eks_cluster" "eks_cluster" {
  name     = "Three-tier-cloud"
  role_arn = "arn:aws:iam::642825399412:role/eks-role-cluster"

  vpc_config {
    subnet_ids = data.aws_subnets.public.ids
  }

  bootstrap_self_managed_addons = false

  lifecycle {
    ignore_changes = [
      access_config,
      kubernetes_network_config,
      upgrade_policy,
      enabled_cluster_log_types,
      tags,
      vpc_config[0].security_group_ids,
      vpc_config[0].public_access_cidrs,
    ]
  }
}

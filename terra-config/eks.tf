resource "aws_eks_cluster" "eks_cluster" {
  name     = "Three-tier-cloud"
  role_arn = "arn:aws:iam::642825399412:role/eks-role-cluster"

  vpc_config {
    subnet_ids = data.aws_subnets.public.ids
  }

  bootstrap_self_managed_addons = false
}

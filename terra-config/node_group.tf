resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "EKS_NODE_GROUP"

  node_role_arn = data.aws_iam_role.eks_node_role.arn
  subnet_ids     = data.aws_subnets.public.ids

  instance_types = ["t3.small"]
  ami_type       = "AL2023_x86_64_STANDARD"

  update_config {
    max_unavailable = 1
  }

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  depends_on = [
    aws_eks_cluster.eks_cluster
  ]
}

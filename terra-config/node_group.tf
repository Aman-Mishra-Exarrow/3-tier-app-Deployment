resource "aws_eks_node_group" "default" {
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "default-ng"
  node_role_arn  = aws_iam_role.eks_nodes.arn
  subnet_ids     = aws_subnet.public[*].id

  instance_types = ["t3.small"]
  ami_type       = "AL2023_x86_64_STANDARD"

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_eks_cluster.eks
  ]
}

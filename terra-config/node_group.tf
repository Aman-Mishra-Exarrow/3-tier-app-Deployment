resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "EKS_NODE_GROUP"

  node_role_arn = "arn:aws:iam::642825399412:role/eks-node-group-example"
  subnet_ids     = data.aws_subnets.public.ids

  launch_template {
    name    = "Three-tier-cloud-node-template"
    version = "$Latest"
  }

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}

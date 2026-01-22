data "aws_iam_role" "eks_cluster_role" {
  name = "eks-role-cluster"
}

data "aws_iam_role" "eks_node_role" {
  name = "eks-node-group-example"
}

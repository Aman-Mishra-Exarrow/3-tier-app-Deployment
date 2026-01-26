resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version  = "1.34"

   
  vpc_config {
    subnet_ids              = aws_subnet.private[*].id
    endpoint_public_access  = true
    endpoint_private_access = false
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}

resource "aws_eks_access_entry" "admin_user" {
  cluster_name      = aws_eks_cluster.eks.name
  principal_arn     = "arn:aws:iam::642825399412:user/test-user-501"
  kubernetes_groups = ["system:masters"]
  type             = "STANDARD"
}
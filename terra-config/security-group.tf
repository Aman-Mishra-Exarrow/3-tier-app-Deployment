resource "aws_security_group" "eks_nodes" {
  name        = "eks-nodes-sg"
  description = "EKS worker nodes SG"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description     = "Allow EKS control plane to nodes"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id]
  }

  ingress {
    description = "Node to node communication"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

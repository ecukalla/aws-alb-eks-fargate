resource "aws_iam_role" "eks_cluster" {
  name = "${var.cluster_name}-eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
  managed_policy_arns = [
    "arn:aws::iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws::iam::aws:policy/AmazonEKSVPCResourceController"
  ]
}

resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn
  version = var.eks_version

  vpc_config {
    subnet_ids = var.subnet_ids
    security_group_ids = [var.security_group_id]
  }
}

resource "aws_eks_fargate_profile" "main" {
  cluster_name           = ""
  fargate_profile_name   = ""
  pod_execution_role_arn = ""
}

resource "aws_iam_role" "fargate_pod_execution_role" {
  assume_role_policy = ""
}
/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "aws_eks_cluster" "main" {
  name      = var.name
  role_arn  = var.eks_iam_role_cluster
  version   = var.eks_version


  vpc_config {
    security_group_ids      = var.eks_security_groups
    endpoint_private_access = var.eks_private_access
    subnet_ids              = var.eks_cluster_subnet_ids
  }
}
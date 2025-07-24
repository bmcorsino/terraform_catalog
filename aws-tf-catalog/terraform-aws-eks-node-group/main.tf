/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

# EKS Node Group
resource "aws_eks_node_group" "main" {

  cluster_name      = var.eks_cluster_name
  node_group_name   = local.node_group_name
  node_role_arn     = var.eks_iam_role_node

  subnet_ids        = var.eks_cluster_subnet_ids

  instance_types    = var.eks_instance_types
  disk_size         = var.eks_disk_size

  scaling_config {
    desired_size = try(var.eks_scaling_config.desired_size, 1)
    min_size     = try(var.eks_scaling_config.min_size, 1)
    max_size     = try(var.eks_scaling_config.max_size, 3)
  }

  tags = module.kpmg-aws-config.default_tags
}
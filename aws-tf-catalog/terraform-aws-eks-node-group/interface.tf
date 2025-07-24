variable "eks_cluster_name" {
  type    = string
}
variable "eks_iam_role_node" {
  type    = string
  default = null
}
variable "node_group_name" {
  type    = string
  default = null
}
variable "eks_instance_types" {
  type    = list(any)
  default = ["t3a.medium"]
}
variable "eks_disk_size" {
  type    = number
}
variable "eks_scaling_config" {
  default = {
    desired_size = 1
    min_size     = 1
    max_size     = 3
  }
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
  description = "Task definition"
}
variable "eks_private_access" {
  type        = bool
  default     = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}

locals {
  node_group_name = var.node_group_name == null ? format("%s-node-group", var.name) : var.node_group_name
}

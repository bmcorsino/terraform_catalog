variable "name" {
  type    = string
  default = "cluster-eks"
}
variable "eks_iam_role_cluster" {
  type    = string
  default = null
}
variable "eks_version" {
  type    = string
  default = null
}
variable "eks_security_groups" {
  type    = list(string)
  default = []
}
variable "eks_private_access" {
  type        = bool
  default     = true
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
}
variable "eks_cluster_subnet_ids" {
  type    = list(any)
  default = []
}
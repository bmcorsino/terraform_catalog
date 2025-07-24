variable "subnet_group_name" {
  description = "database subnet group name"
  type        = string
  default     = null
}
variable "subnet_ids" {
  description = "database subnet ids"
  type        = list(any)
}
variable "tags" {
  description = "database tags"
  default = null
}
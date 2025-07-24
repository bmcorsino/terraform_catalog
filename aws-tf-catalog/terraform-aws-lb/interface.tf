variable "aws_lb_name" {
  description = "The name for the Load Balancer"
}
variable "aws_lb_type" {
  description = "The type for the loadbalancer"
  default = "application"
}
variable "aws_lb_is_internal" {
  description = "If the load balancer is internal or not"
  default = false
}
variable "enable_deletion_protection" {
  description = "This will prevent Terraform from deleting the load balancer"
  default = false
}
variable "tags" {
  default = {}
}
variable "ip_address_type" {
  description = "The type of IP addresses used by the subnets"
  default = "ipv4"
}
variable "enable_cross_zone" {
  description = "If true, cross-zone load balancing of the load balancer will be enabled."
  default = false
  
}
variable "aws_subnet_ids" {
  description = "List with subnet ids"
}
variable "aws_sg_lb_id" {
  description = "The security group id for the load balancer"
}
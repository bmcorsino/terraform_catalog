variable "gcp_vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "auto_create_subnetworks" {
  type    = bool
  default = false
}

variable "gcp_subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "ip_cidr_range" {
  type    = string
  default = "10.0.1.0/24"
}

variable "region" {
  type    = string
  default = "eu-west1"
}

variable "mtu" {
  type    = number
  default = null
}
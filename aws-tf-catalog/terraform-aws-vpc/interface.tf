variable "cidr_block_vpc" {
  description = "The IPv4 CIDR block for the VPC"
}

variable "tags" {
}

variable "cidr_block_subnet" {
  description = "The IPv4 CIDR block for the subnet"
  default = ""
}

variable "availability_zone" {
}

variable "cidr_block_subnets" {
  default = []
}

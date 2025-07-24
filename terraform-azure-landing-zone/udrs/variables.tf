variable "resource_group_name" {
  description = "Resource group name that the route table will be created in."
}

variable "route_table_name"{
  description = "Route table Name"
}

variable "vnet_name" {
  description = "Virtual Network name that the route table will be associated."
}

variable "subnet_name" {
  description = "Subnet name that the route table will be associated."
}

variable "route_names" {
  description = "route_names"
  default = []
}

variable "route_adress_prefixes" {
  description = "route_adress_prefixes"
  default = []
}

variable "route_next_hop_types" {
  description = "route_next_hop_types"
  default = []
}

variable "next_hop_in_ip_address" {
  description = "next_hop_in_ip_address"
  default = []
}


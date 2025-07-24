variable "azurerm_subnet_names" {
  description = "List of azurerm_subnets names to use virtual network"
  #type        = "list"
}

variable "azurerm_subnet_resource_group_name" {
  description = "Subnet resource group name"
}

variable "azurerm_subnet_virtual_network_name" {
  description = "Virtual Network to attach the subnets"
}

variable "azurerm_subnet_prefixes" {
  description = "Subnets list of prefix with the same order as the names"
  #type        = "list"
}

variable "azurerm_subnet_delegation" {
  default = []
}
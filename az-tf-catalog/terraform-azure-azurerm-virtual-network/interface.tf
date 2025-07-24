variable "azurerm_virtual_network_name" {
  description = "Virtual network name"
}

variable "azurerm_virtual_network_location" {
  description = "Virtual network resource group location"
}

variable "azurerm_virtual_network_resource_group" {
  description = "Virtual network resource group name"
}

variable "azurerm_virtual_network_address_spaces" {
  description = "Virtual network address spaces"
  type        = "list"
}
variable "azurerm_subnet_name" {
  default = "net-dev-snet-data"
}
variable "azurerm_subnet_prefixes" {
  default = []
}
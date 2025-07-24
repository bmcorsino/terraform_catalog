variable "azurerm_network_interface_name" {
  description = "Network interface name"
}

variable "azurerm_network_interface_count" {
  description = "Network interface count"
  default = 1
}
variable "azurerm_network_interface_resource_group_location" {
  description = "Network Interface resource group location"
}

variable "azurerm_network_interface_resource_group_name" {
  description = "Network Interface resource group name"
}

variable "azure_virtual_machine_multi_node_type" {
 description = "Azure virtal machine  multi node type"
	default = "s"
}

variable "azurerm_network_interface_start_suffix" {
  default = 0
}

variable "azurerm_network_interface_network_security_group_id" {
  description = "Network Interface network security group (optional)"
  default     = ""
}

variable "azurerm_network_interface_enable_accelerated_networking" {
  description = "Network Interface enable accelerated networking (optional)"
  default     = "false"
}

variable "azurerm_network_interface_ip_configuration_name" {
  description = "Network Interface IP configuration name"
}

variable "azurerm_network_interface_ip_configuration_subnet_id" {
  description = "Network Interface Subnet id for ip association"
}

variable "azurerm_network_interface_ip_configuration_private_ip_address_allocation" {
  description = "Network Interface type of ip allocation ex: dynamic,static"
  default     = "Dynamic"
}

variable "azurerm_network_interface_ip_configuration_private_ip_address" {
  description = "Network Interface private IP address in case of static allocation"
  default     = ""
}

variable "azurerm_network_interface_ip_configuration_public_ip_address_id" {
  description = "Network Interface public IP address (optional)"
  default     = ""
}

variable "azurerm_network_interface_tags" {
  description = "Network interface tags"

  default = {
    App         = ""
    Owner       = ""
    BU          = ""
    Description = ""
    Environment = ""
  }
}

variable "autoincrement" {
  default = 1
}

locals {
  autoincrement = var.autoincrement + var.azurerm_network_interface_start_suffix
}
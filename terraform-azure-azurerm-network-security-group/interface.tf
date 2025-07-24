variable "azurerm_network_security_group_name" {
  description = "Network security group name"
}

variable "azurerm_network_security_group_location" {
  description = "Network security group name"
}

variable "azurerm_network_security_group_resource_group_name" {
  description = "Network security group resource group"
}

variable "azurerm_network_security_group_tags" {
  description = "Network security group tags"

  default = {
    App         = ""
    BU          = ""
    Owner       = ""
    Description = ""
    Environment = ""
  }
}

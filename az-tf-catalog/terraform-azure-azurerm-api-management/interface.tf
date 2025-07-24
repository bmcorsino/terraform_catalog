variable "azurerm_api_management_name" {
  description = "Azure Api Management Name"
}
variable "azurerm_api_management_location" {
  description = "Location"
  default = "West Europe"
}
variable "azurerm_api_management_resource_group_name" {
  description = "Azure Api Management Resource Group name"
}
variable "azurerm_api_management_list" {
    type = list(map(string))
    description = "resource group properties"
}
locals {
  azurerm_create_api_management_map = {
      for k, v in var.azurerm_api_management_list :
        k => v
  }
}
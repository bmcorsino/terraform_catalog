variable "azurerm_storage_share_name" {
  description = "Share name"
}
variable "azurerm_storage_account_name" {
  description = "App name"
}
variable "azurerm_resource_group_name" {
  description = "Storage Account resource group name"
}
variable "azurerm_storage_share_list" {
    type = list(map(string))
    description = "resource group properties"
}
locals {
  azurerm_create_storage_share_map = {
      for k, v in var.azurerm_storage_share_list :
        k => v
  }
}
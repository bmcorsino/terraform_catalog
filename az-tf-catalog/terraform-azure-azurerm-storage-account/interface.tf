variable "azurerm_storage_account_name" {
  description = "App name"
}
variable "azurerm_resource_group_name" {
  description = "Storage Account resource group name"
}
variable "azurerm_resource_location" {
  description = "Storage Account location"
}
#security configs
variable "azurerm_storage_account_enable_https_traffic_only" {
  description = "(Optional) Boolean flag which forces HTTPS if enabled"
  default = "false"
}
variable "azurerm_storage_account_bypass" {
  description = "(Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None"
  default = ["Logging","Metrics","AzureServices"]
}

variable "azurerm_storage_account_tags" {
  description = "Resource Group tags to associate with our resources."
  default     = {}
}
variable "azurerm_storage_account_list" {
    description = "resource group properties"
}
locals {
  azurerm_create_storage_account_map = {
      for k, v in var.azurerm_storage_account_list :
        k => v
  }
}
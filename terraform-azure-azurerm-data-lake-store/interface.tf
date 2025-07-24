variable "azurerm_data_lake_name" {
  description = "Azure Data Lake Store name"
}
variable "azurerm_data_lake_location" {
  description = "Location"
  default = "West Europe"
}
variable "azurerm_data_lake_resource_group_name" {
  description = "Azure Data Lake Store Resource Group name"
}
variable "azurerm_data_lake_sku" {
  description = "Azure Data Lake Store sku"
  default     = "standard"
}
variable "azurerm_data_lake_list" {
    type = list(map(string))
    description = "resource group properties"
}
locals {
  suffix = {
    for k, v in var.azurerm_data_lake_list :
      k => v.suffix != "" ? v.suffix : "${k < 10 ? "0" : ""}${k + 1}"
  }

  azurerm_create_data_lake_list = {
      for k, v in var.azurerm_data_lake_list :
        k => v
  }
}
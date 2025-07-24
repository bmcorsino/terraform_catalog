variable "azurerm_analysis_services_server_location" {
    description = "Azure Analysis Services Server location"
}
variable "azurerm_analysis_services_server_resource_group_name" {
    description = "Azure Analysis Services Server resource group"
}
variable "azurerm_analysis_services_server_name" {}

variable "azurerm_analysis_services_server_list" {
    description = "resource properties"
}
variable "azurerm_analysis_services_server_tags" {
    default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
  azurerm_analysis_services_server_suffix_name = {
    for k, v in var.azurerm_analysis_services_server_list :
      k => v.suffix == "" ? "${k<10?"0":""}${k+1}" : v.suffix
  }

  azurerm_analysis_services_server_map = {
      for k, v in var.azurerm_analysis_services_server_list :
        k => v
  }
}
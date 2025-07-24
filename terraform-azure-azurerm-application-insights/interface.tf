variable "azurerm_application_insights_location" {
    description = "Azure Application Insights location"
}
variable "azurerm_application_insights_resource_group_name" {
    description = "Azure Application Insights resource group"
}
variable "azurerm_application_insights_name_prefix" {}

variable "azurerm_application_insights_list" {
    description = "resource properties"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "azurerm_application_insights_tags" {
    default = {}
}
locals {
  azurerm_application_insights_suffix_name = {
    for k, v in var.azurerm_application_insights_list :
      k => v.suffix == "" ? "${k<10?"0":""}${k+1}" : v.suffix
  }

  azurerm_application_insights_map = {
      for k, v in var.azurerm_application_insights_list :
        k => merge(v, {
          name = "${var.azurerm_application_insights_name_prefix}${v.role!=""?"-${v.role}":""}-appinsights-${local.azurerm_application_insights_suffix_name[k]}"
        })
  }

  azurerm_application_insights_map_key = {
      for k, v in local.azurerm_application_insights_map :
        k => v
          if length(v.insights_api_key) > 0
  }
  # Created
  azurerm_application_insights_created = {
      for k, v in azurerm_application_insights.main :
        v.name => {
          id = v.id
          instrumentation_key = v.instrumentation_key
          app_id = v.app_id
        }
  }
}
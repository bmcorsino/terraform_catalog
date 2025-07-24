variable "azurerm_app_service_plan_name" {
  description = "Azure App Service Plan name"
}
variable "azurerm_app_service_plan_location" {
  description = "Azure App Service Plan location"
}
variable "azurerm_app_service_plan_resource_group_name" {
  description = "Azure App Service Plan Resource Group name"
}
variable "azurerm_app_service_plan_os_type" {
  description = "Azure App Service Plan OS Type"
}
variable "azurerm_app_service_plan_reserved" {
  description = "Azure App Service Plan reserved"
}
variable "azurerm_app_service_plan_maximum_elastic_worker_count" {
  description = "Azure App Service Plan Maximum elastic worker count"
  default = null
}
variable "azurerm_app_service_plan_sku_name" {
  description = "Azure App Service Plan SKU name"
}
variable "azurerm_app_service_plan_tags" {
  description = "Azure App Service Plan resource tags"
}

locals {
  azurerm_app_service_plan_maximum_elastic_worker_count = contains(["EP1", "EP2", "EP3", "Y1"], var.azurerm_app_service_plan_sku_name) ? 1 : null
}
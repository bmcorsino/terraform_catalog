variable "azurerm_app_service_name" {
  description = "Azure App Service name"
}
variable "azurerm_app_service_location" {
  description = "Azure App Service location"
}
variable "azurerm_resource_group_name" {
  description = "Azure App Service resource group"
}
variable "azurerm_app_service_app_parameters" {
    description = "Azure App Service App Parameters"
    default = {}
}
variable "azurerm_app_service_workflow_schema" {
    description = "Azure App Service App Workflow Schema"
    default = "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json"
}
variable "azurerm_app_service_workflow_version" {
    description = "Azure App Service App Workflow Schema"
    default = "1.0.0.0"
}
variable "azurerm_numbers_logic_app" {
  default = 1
}
variable "azurerm_logicapp_start_suffix" {
  default = 1
}
variable "autoincrement" {
  default = 1
}
variable "tags" {
  default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
  autoincrement = var.autoincrement + var.azurerm_logicapp_start_suffix
}
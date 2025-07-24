variable "azurerm_datafactory_workspace_name" {
  description = "Azure Datafactory Workspace name"
}
variable "azurerm_datafactory_workspace_location" {
  description = "Location"
  default = "West Europe"
}
variable "azurerm_datafactory_workspace_resource_group_name" {
  description = "Azure Datafactory Workspace Resource Group name"
}
variable "azurerm_datafactory_count" {
  default = 1
}
variable "azurerm_datafactory_start_suffix" {
  default = 0
}
variable "autoincrement" {
  default = 1
}
variable "azurerm_datafactory_role" {
  default = ""
}
variable "tags" {
  default = {}
}
locals {
  autoincrement = var.autoincrement + var.azurerm_datafactory_start_suffix
  role          = var.azurerm_datafactory_role != "" ? "-${var.azurerm_datafactory_role}" : ""
}
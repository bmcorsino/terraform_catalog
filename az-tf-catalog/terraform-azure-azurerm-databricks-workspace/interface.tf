variable "azurerm_databricks_workspace_name" {
  description = "Azure Databricks Workspace name"
}
variable "azurerm_databricks_workspace_location" {
  description = "Location"
  default = "West Europe"
}
variable "azurerm_databricks_workspace_resource_group_name" {
  description = "Azure Databricks Workspace Resource Group name"
}
variable "azurerm_databricks_workspace_sku" {
  description = "Azure Databricks Workspace sku"
  default     = "standard"
}
variable "azurerm_databricks_workspace_tags" {
  description = "Azure Databricks resource tags"
  default = {}
}
variable "azurerm_databricks_workspace_list" {
    description = "resource group properties"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
    azurerm_create_databricks_workspace_list = {
        for k, v in var.azurerm_databricks_workspace_list :
          k => v
    }
}
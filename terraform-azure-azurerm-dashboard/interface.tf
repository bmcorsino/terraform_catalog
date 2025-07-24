variable "azurerm_dashboard_name" {
  description = "dashboard name"
}
variable "azurerm_dashboard_resource_group_location" {
  description = "dashboard resource group location"
}
variable "azurerm_dashboard_resource" {
  description = "dashboard resource map index"
}
variable "azurerm_dashboard_resource_group_name" {
  description = "dashboard resource group name"
}
variable "azurerm_dashboard_path_from_module" {
  description = "Dashboard template file path bellow module."
}
variable "azurerm_dashboard_object_list" {
  description = "IDs of object to include in Dashboard."
}
variable "azurerm_dashboard_name_if_exists" {
  default = ""
}
variable "azurerm_dashboard_tags" {
  description = "Dashboard tags"

  default = {
    App         = ""
    Owner       = ""
    BU          = ""
    Description = ""
    Environment = ""
  }
}

locals {
  dashboard_map = {
    for k, v in var.azurerm_dashboard_object_list :
      k => merge({index = k},v)
  }
}

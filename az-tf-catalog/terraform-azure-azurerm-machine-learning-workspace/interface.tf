variable "azurerm_machine_learning_workspace_location" {
    description = "Azure Machine Learning Workspace location"
}
variable "azurerm_machine_learning_workspace_resource_group_name" {
    description = "Azure Machine Learning Workspace resource group"
}
variable "azurerm_machine_learning_workspace_name_prefix" {}

variable "azurerm_machine_learning_workspace_list" {
    description = "resource properties"
}
variable "identity" {
    default = "SystemAssigned"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "azurerm_machine_learning_workspace_tags" {
    default = {}
}
locals {
  azurerm_machine_learning_workspace_suffix_name = {
    for k, v in var.azurerm_machine_learning_workspace_list :
      k => v.suffix == "" ? "${k<10?"0":""}${k+1}" : "${v.suffix}"
  }

  azurerm_machine_learning_workspace_map = {
      for k, v in var.azurerm_machine_learning_workspace_list :
        k => v
  }
}
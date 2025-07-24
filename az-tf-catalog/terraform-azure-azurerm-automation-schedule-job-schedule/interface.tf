variable "azurerm_resource_group_name" {
}
variable "azurerm_automation_account_name" {
}
variable "azurerm_automation_account_runbook_name" {
}
variable "azurerm_automation_schedule_description" {
  default = "Created by Terraform"
}
variable "azurerm_automation_schedule_job_array" {
    type = list(map(string))
    description = "resource group properties"
}
locals {
  azurerm_schedule_job_map = {
      for k, v in var.azurerm_automation_schedule_job_array : 
          "schedule-${k}"
              =>  v
  }
}
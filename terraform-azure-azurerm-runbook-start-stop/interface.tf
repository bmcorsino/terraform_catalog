variable "azurerm_azurerm_runbook_name" {
  description = "Azure Runbook Name"
  default = "TZScheduledStartStop"
}
variable "azurerm_runbook_location" {
  description = "Azure Runbook Location"
}
variable "azurerm_resource_group_name" {
  description = "Azure App Service resource group"
}
variable "azurerm_azurerm_runbook_tags" {
    description = "Azure Runbook Tags"
}
variable "azurerm_automation_account_name" {
    description = "Azure Runbook Account Name"
}
variable "azurerm_azurerm_runbook_log_verbose" {
    description = "Azure Runbook Log Verbose"
    default = "true"
}
variable "azurerm_azurerm_runbook_log_progress" {
    description = "Azure Runbook Log Progress"
    default = "true"
}
variable "azurerm_azurerm_runbook_description" {
    description = "Azure Runbook Description"
    default = "Turns start/stop instance based on schedule"
}
variable "azurerm_azurerm_runbook_type" {
    description = "Azure Runbook Type"
    default = "PowerShell"
}
variable "azurerm_azurerm_runbook_publish_content_link" {
    description = "Azure Runbook Publish Content Link"
    default = "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/c4935ffb69246a6058eb24f54640f53f69d3ac9f/101-automation-runbook-getvms/Runbooks/Get-AzureVMTutorial.ps1"
}
variable "azurerm_runbook_exists" {
  default = false
}

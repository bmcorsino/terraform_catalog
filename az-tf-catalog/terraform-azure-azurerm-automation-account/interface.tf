variable "azurerm_automation_account_name" {
  description = "Azure Automation Account Name"
}
variable "azurerm_automation_account_location" {
  description = "Azure Automation Account Location"
}
variable "azurerm_resource_group_name" {
  description = "Azure App Service resource group"
}
variable "azurerm_automation_account_tags" {
    description = "Azure Automation Account Tags"
}
variable "azurerm_automation_account_sku" {
    description = "Azure Automation Account SKU"
    default = "Basic"
}
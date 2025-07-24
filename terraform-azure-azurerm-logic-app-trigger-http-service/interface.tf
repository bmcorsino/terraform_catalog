variable "azurerm_app_trigger_name" {
  description = "Azure App Trigger Name"
}
variable "azurerm_app_logic_app_id" {
  description = "Azure Logic App ID"
}
variable "azurerm_app_trigger_method" {
  description = "Azure App Trigger Method"
}
variable "azurerm_app_trigger_relative_path" {
  description = "Azure App Trigger Relative Path"
  default = ""
}
variable "azurerm_app_trigger_schema" {
  description = "Azure App Trigger Schema"
  default = "{}"
}
variable "azurerm_app_trigger_enabled" {
  default = false
}
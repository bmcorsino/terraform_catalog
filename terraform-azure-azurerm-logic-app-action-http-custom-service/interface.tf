variable "azurerm_app_action_name" {
  description = "Azure App Action Name"
}
variable "azurerm_app_logic_app_id" {
  description = "Azure Logic App ID"
}
variable "azurerm_app_action_body" {
  description = "Azure App Action Body"
  default = "{}"
}
variable "azurerm_app_action_enabled" {
  default = false
}
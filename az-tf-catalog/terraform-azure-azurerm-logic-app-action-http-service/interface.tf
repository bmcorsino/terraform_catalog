variable "azurerm_app_action_name" {
  description = "Azure App Action Name"
}
variable "azurerm_app_logic_app_id" {
  description = "Azure Logic App ID"
}
variable "azurerm_app_action_method" {
  description = "Azure App Action Method"
}
variable "azurerm_app_action_uri" {
  description = "Azure App Action URI"
  default = ""
}
variable "azurerm_app_action_body" {
  description = "Azure App Action Body"
  default = "{}"
}
variable "azurerm_app_action_headers" {
  description = "Azure App Action Headers"
  default = "{}"
}
variable "azurerm_app_action_enabled" {
  default = false
}
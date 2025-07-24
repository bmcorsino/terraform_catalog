variable "azurerm_resource_group_name" {}
variable "azuread_user" {}
variable "login" {}
variable "server_name" {}
variable "azurerm_resource_depends_on" {
    default = [""]
}
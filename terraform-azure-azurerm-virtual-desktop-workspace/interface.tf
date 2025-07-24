variable "name" {}
variable "friendly_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "tags" {
    default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
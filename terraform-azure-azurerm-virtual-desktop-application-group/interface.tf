variable "location" {}
variable "resource_group_name" {}
variable "type" {
    default = "RemoteApp"
}
variable "host_pool_id" {}
variable "name" {}
variable "friendly_name" {}
variable "tags" {
    default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
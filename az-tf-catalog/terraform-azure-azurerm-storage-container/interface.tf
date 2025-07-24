variable "azurerm_storage_container_resource_group_name" {}
variable "azurerm_storage_account_name" {}
variable "azurerm_storage_container_list" {
    default = []
}
variable "container_access_type" {
    default = "private"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
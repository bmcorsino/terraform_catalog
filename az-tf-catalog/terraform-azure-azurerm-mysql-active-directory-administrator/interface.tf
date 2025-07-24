variable "azurerm_resource_group_name" {
}
variable "azurerm_mysql_server_list" {
  description = "list config mysql"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
  mysql_active_directory_administrator_map = {
    for k, v in var.azurerm_mysql_server_list :
      k => v
  }
}
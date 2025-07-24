variable "azurerm_resource_group_name" {}
variable "azurerm_db_server_location" {}
variable "tags" {
  default = {}
}
variable "azurerm_mariadb_server_name" {}
variable "azurerm_mariadb_server_sku_name" {}
variable "azurerm_mariadb_server_storage_size_mb" {}
variable "azurerm_mariadb_server_backup_retention_days" {}
variable "azurerm_mariadb_server_administrator_login_user" {}
variable "azurerm_mariadb_server_administrator_login_password" {}
variable "azurerm_mariadb_server_version" {}
variable "azurerm_mariadb_server_ssl_enforcement_enabled" {}
variable "azurerm_mariadb_server_create_mode" {}
variable "azurerm_mariadb_server_auto_grow_enabled" {}
variable "azurerm_mariadb_server_geo_redundant_backup_enabled" {}
variable "azurerm_mariadb_server_public_network_access_enabled" {}
variable "azurerm_postgresql_server_database_name" {
  description = "Azure PostgreSQL server database name"
}

variable "azurerm_postgresql_server_database_charset" {
  description = "Azure PostgreSQL server database charset"
  default     = "UTF8"
}

variable "azurerm_postgresql_server_database_collation" {
  description = "Azure PostgreSQL server database collation"
  default     = "English_United States.1252"
}

variable "azurerm_postgresql_server_database_server_name" {
  description = "Azure PostgreSQL server database server name"
}

variable "azurerm_postgresql_server_database_resource_group_name" {
  description = "Azure PostgreSQL server database resource group"
}
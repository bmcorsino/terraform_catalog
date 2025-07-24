resource "azurerm_postgresql_database" "main" {
  name                       = var.azurerm_postgresql_server_database_name
  server_name                = var.azurerm_postgresql_server_database_server_name
  charset                    = var.azurerm_postgresql_server_database_charset
  collation                  = var.azurerm_postgresql_server_database_collation
  resource_group_name        = var.azurerm_postgresql_server_database_resource_group_name
}
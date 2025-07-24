output "azurerm_postgresql_server_database_id" {
  description = "Azure PostgreSQL server database ID"
  value       = "${azurerm_postgresql_database.main.id}"
}
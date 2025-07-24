output "azurerm_postgresql_server_id" {
  description = "Azure PostgreSQL server ID"
  value       = azurerm_postgresql_server.main.id
}

output "azurerm_postgresql_server_name" {
  description = "Azure PostgreSQL server Name"
  value       = azurerm_postgresql_server.main.name
}

output "azurerm_postgresql_server_fqdn" {
  description = "Azure PostgreSQL server fqdn"
  value       = azurerm_postgresql_server.main.fqdn
}

output "main" {
  value       = azurerm_postgresql_server.main
}
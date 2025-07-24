output "server_id" {
  description = "Azure PostgreSQL server ID"
  value       = azurerm_postgresql_flexible_server.main.id
}

output "server_name" {
  description = "Azure PostgreSQL server Name"
  value       = azurerm_postgresql_flexible_server.main.name
}

output "server_fqdn" {
  description = "Azure PostgreSQL server fqdn"
  value       = azurerm_postgresql_flexible_server.main.fqdn
}

output "public_network_access_enabled" {
  value       = azurerm_postgresql_flexible_server.main.public_network_access_enabled
}

output "main" {
  value       = azurerm_postgresql_flexible_server.main
}
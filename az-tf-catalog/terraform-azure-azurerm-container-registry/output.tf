
output "azurerm_container_registru_id" {
  description = "Azure container registry ID"
  value       = "${azurerm_container_registry.main.id}"
}
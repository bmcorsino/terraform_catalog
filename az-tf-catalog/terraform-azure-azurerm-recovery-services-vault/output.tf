output "azurerm_recovery_services_vault_name" {
  description = "Recovery services vault name"
  value       = "${azurerm_recovery_services_vault.main.name}"
}
output "azurerm_recovery_services_protection_policy_id" {
  description = "Recovery services policy ID"
  value       = "${azurerm_recovery_services_protection_policy_vm.main.id}"
}
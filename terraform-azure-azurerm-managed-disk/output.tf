output "azurerm_managed_disk_id" {
  description = "Azure managed disk ID"
  value       = "${azurerm_managed_disk.main.id}"
}
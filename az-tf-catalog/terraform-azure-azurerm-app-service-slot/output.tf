output "azurerm_app_service_slot_id" {
  description = "Azure App Service Slot ID"
  value       = "${azurerm_app_service_slot.main.id}"
}
output "azurerm_app_service_slot_default_site_hostname" {
  description = "Azure App Service Slot default site hostname"
  value       = "${azurerm_app_service_slot.main.default_site_hostname}"
}
output "azurerm_app_service_slot_site_credential_password" {
  description = "Azure App Service Slot site credential password"
  value       = "${azurerm_app_service_slot.main.site_credential}"
}

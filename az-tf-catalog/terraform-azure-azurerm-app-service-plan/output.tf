output "azurerm_app_service_plan_id" {
  description = "Web App Plan ID"
  value       = "${azurerm_service_plan.main.id}"
}

output "azurerm_app_service_plan_maximum_number_of_workers" {
  description = "Azure App Service Plan maximum number of workers"
  value       = "${azurerm_service_plan.main.maximum_number_of_workers}"
}
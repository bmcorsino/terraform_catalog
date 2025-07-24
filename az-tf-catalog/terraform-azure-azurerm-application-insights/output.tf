output "main" {
  value = azurerm_application_insights.main
  sensitive = true
}
output "main-key" {
  value = { 
    for k, v in azurerm_application_insights_api_key.main : 
        replace(v.name, "-permissions-api-key", "") => {
            id                            = v.id
            api_key                       = v.api_key
            insights_application_id       = local.azurerm_application_insights_created[replace(v.name, "-permissions-api-key", "")].app_id
            insights_instrumentation_key  = local.azurerm_application_insights_created[replace(v.name, "-permissions-api-key", "")].instrumentation_key
        }
  }
  sensitive = true
}
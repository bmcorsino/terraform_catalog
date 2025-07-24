output "azurerm_api_management_id" {
  value = { 
    for k, v in azurerm_api_management.main : 
        k => v.id
  }
}
output "azurerm_api_management_gateway_url" {
  value = { 
    for k, v in azurerm_api_management.main : 
        k => v.gateway_url 
  }
}
output "azurerm_api_management_portal_url" {
  value = { 
    for k, v in azurerm_api_management.main : 
        k => v.portal_url
  }
}
output "azurerm_api_management_additional_location" {
  value = { 
    for k, v in azurerm_api_management.main : 
        k => v.additional_location
  }
}
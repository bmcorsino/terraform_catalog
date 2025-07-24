output "azurerm_data_factory_id" {
  value = { 
    for k, v in azurerm_data_factory.main : 
        k => v.id
  }
}

output "azurerm_data_factory_identity" {
  value = { 
    for k, v in azurerm_data_factory.main : 
        k => v.identity
  }
}

output "main" {
  value = azurerm_data_factory.main
}
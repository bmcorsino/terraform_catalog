output "azurerm_data_lake_store_id" {
  value = { 
    for k, v in azurerm_data_lake_store.main : 
        k => v.id
  }
}

output "main" {
  value = azurerm_data_lake_store.main
}
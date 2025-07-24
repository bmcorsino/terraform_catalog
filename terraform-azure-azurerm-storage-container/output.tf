output "azurerm_storage_container_id" {
  value = {
    for k, v in azurerm_storage_container.main : 
      v.id => v.id
  }
}

output "main" {
  value = azurerm_storage_container.main
}
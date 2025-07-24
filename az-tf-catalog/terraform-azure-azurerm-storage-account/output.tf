output "azurerm_storage_account_id" {
  value = { 
    for k, v in azurerm_storage_account.main : 
        k => v.id
  }
}
output "azurerm_storage_account_list_id" {
  value = [
    for k, v in azurerm_storage_account.main : 
      v.id
  ]
}
output "azurerm_storage_account_name_before_create" {
  value = [
    for k, v in local.azurerm_create_storage_account_map :
      v.name
  ]
}
output "azurerm_storage_account_name" {
  value = { 
    for k, v in azurerm_storage_account.main : 
        k => v.name
  }
}
output "azurerm_storage_account_primary_access_key" {
  value = { 
    for k, v in azurerm_storage_account.main : 
        k => v.primary_access_key
  }
}

output "azurerm_storage_account_main" {
  value = azurerm_storage_account.main
}
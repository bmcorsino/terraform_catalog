output "azurerm_cosmosdb_account_id" {
  value = { 
    for k, v in azurerm_cosmosdb_account.main : 
        k => v.id
  }
}

output "azurerm_cosmosdb_account_endpoint" {
  value = { 
    for k, v in azurerm_cosmosdb_account.main : 
        k => v.endpoint
  }
}

output "azurerm_cosmosdb_name_before_create" {
  value = [
    for k, v in local.azurerm_create_cosmosdb_map : 
      v.name
  ]
}
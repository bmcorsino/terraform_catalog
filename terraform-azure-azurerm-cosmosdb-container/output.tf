output "azurerm_cosmosdb_sql_container_id" {
  value = { 
    for k, v in azurerm_cosmosdb_sql_container.main : 
        k => v.id
  }
}
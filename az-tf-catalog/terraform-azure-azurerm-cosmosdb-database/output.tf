output "azurerm_cosmosdb_sql_database_id" {
  value = { 
    for k, v in azurerm_cosmosdb_sql_database.main : 
        k => v.id
  }
}
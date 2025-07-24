output "azurerm_sql_elasticpool" {
  value = { 
    for k, v in azurerm_sql_elasticpool.main : 
        k => v.id
  }
}

output "azurerm_sql_elasticpool_name" {
  value = {
    for k, v in azurerm_sql_elasticpool.main : 
      v.name => v.name
  }
}
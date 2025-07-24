output "azurerm_sql_server_id" {
  value = { 
    for k, v in azurerm_mssql_server.main : 
        k => v.id
  }
}

output "azurerm_sql_server_name" {
  value = {
    for k, v in azurerm_mssql_server.main : 
      v.name => v.name
  }
}
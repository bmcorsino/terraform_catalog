output "azurerm_sql_database_id" {
  value = { 
    for k, v in merge(azurerm_sql_database.main, azurerm_sql_database.main-ep) : 
        k => v.id
  }
}

output "azurerm_sql_database_creation_date" {
  value = { 
    for k, v in merge(azurerm_sql_database.main, azurerm_sql_database.main-ep) : 
        k => v.creation_date
  }
}

output "azurerm_sql_database_default_secondary_location" {
  value = { 
    for k, v in merge(azurerm_sql_database.main, azurerm_sql_database.main-ep) : 
        k => v.default_secondary_location
  }
}
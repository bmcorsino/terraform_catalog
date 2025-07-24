output "main" {
  value = concat(
    azurerm_mssql_database.main,
    azurerm_mssql_database.main_serveless,
    azurerm_mssql_database.main_dw,
    azurerm_mssql_database.main_elastic_dtu)
}
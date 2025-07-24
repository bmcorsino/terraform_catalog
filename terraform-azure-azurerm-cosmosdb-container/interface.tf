variable "azurerm_cosmosdb_container_name" {
}
variable "azurerm_resource_group_name" {
}
variable "azurerm_cosmosdb_account_name" {
}
variable "azurerm_cosmosdb_database_name" {
}
variable "throughput" {
  default = 400
}
variable "azurerm_cosmosdb_list_array" {
    type = list(map(map(string)))
    description = "resource group properties"
}
locals {
  azurerm_create_cosmosdb_map = {
      for k, v in var.azurerm_cosmosdb_list_array :
        k => v
          if v.sql_container_data.azurerm_cosmosdb_container_blocked_to_use == "false" // retrocompatibilidade
  }
  azurerm_unique_key_list = {
      for k, v in var.azurerm_cosmosdb_list_array :
        k => split(",", v.sql_container_data.azurerm_cosmosdb_unique_key)
          if v.sql_container_data.azurerm_cosmosdb_container_blocked_to_use == "false" // retrocompatibilidade
  }
}
                
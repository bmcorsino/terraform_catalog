variable "azurerm_cosmosdb_database_name" {
}
variable "azurerm_resource_group_name" {
}
variable "azurerm_cosmosdb_container_location" {
}
variable "azurerm_cosmosdb_account_name" {
  default = "cosmosdb-account-name"
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
  }
}
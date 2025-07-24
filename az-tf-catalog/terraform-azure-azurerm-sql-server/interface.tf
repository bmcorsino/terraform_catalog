variable "azurerm_db_server_name" {
}
variable "azurerm_resource_group_name" {
}
variable "azurerm_db_server_location" {
  default = "Westeurope"
}
variable "azurerm_db_server_version" {
  default = "12.0"
}
variable "azurerm_db_database_tags" {
  default = {}
}
variable "azurerm_sql_database_id" {
  default = {}
}
variable "azurerm_single_database_list" {
    type = list(map(map(string)))
    description = "resource group properties"
}

locals {
  // NEW
  azurerm_single_database_map = {
      for k, v in var.azurerm_single_database_list :
        "db-${k}"
            => v.db_server_data
                if 
                  v.db_server_data.azurerm_db_server_exists == "false"
  }

  azurerm_db_server_name_suffix = {
    for k, v in var.azurerm_single_database_list :
      "db-${k}" => v.db_server_data.azurerm_db_server_suffix == "" ? "${k<10?"0":""}${k+1}" : "${v.db_server_data.azurerm_db_server_suffix}"
  }
}
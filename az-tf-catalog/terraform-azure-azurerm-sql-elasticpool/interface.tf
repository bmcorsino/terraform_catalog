variable "azurerm_sql_elasticpool_name" {
}
variable "azurerm_resource_group_name" {
}
variable "azurerm_db_server_location" {
}
variable "azurerm_db_server_name" {
}
variable "azurerm_app_db_server_list" {
  default = {}
}
variable "azurerm_single_database_list" {
    type = list(map(map(string)))
    description = "resource group properties"
}

locals {
  pool_name     = "${var.azurerm_sql_elasticpool_name}" // only new
  db_dtu_min    = 0

  azurerm_db_server_name_suffix = {
    for k, v in var.azurerm_single_database_list :
      k => v.db_server_data.azurerm_db_server_suffix == "" ? "${k<10?"0":""}${k+1}" : "${v.db_server_data.azurerm_db_server_suffix}"
  }

  azurerm_create_elasticpool_name_suffix = {
    for k, v in var.azurerm_single_database_list :
      k => v.db_server_elastic_pool_data.azurerm_elastic_pool_suffix == "" ? "${k<10?"0":""}${k+1}" : "${v.db_server_elastic_pool_data.azurerm_elastic_pool_suffix}"
  }

  azurerm_db_server_name_list = {
    for k, v in var.azurerm_single_database_list :
      k => v.db_server_data.azurerm_db_server_exists == "true" ? v.db_server_data.azurerm_db_server_name : "${var.azurerm_db_server_name}-${local.azurerm_db_server_name_suffix[k]}"
  }

  azurerm_use_elastic_map = {
      for k, v in var.azurerm_single_database_list :
        k => merge(v.db_server_elastic_pool_data, {
          server_name = v.db_server_data.azurerm_db_server_exists == "true" ? v.db_server_data.azurerm_db_server_name : var.azurerm_app_db_server_list[local.azurerm_db_server_name_list[k]]
          })
                if 
                  v.db_server_elastic_pool_data.azurerm_elastic_pool_exists == "false" && v.db_server_elastic_pool_data.azurerm_elastic_pool_blocked_to_use == "false"
  }
}
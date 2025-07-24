variable "azurerm_db_server_name_new" {
}
variable "azurerm_resource_group_name" {
}
variable "azurerm_db_server_location" {
}
variable "azurerm_db_server_collation" {
  default = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}
variable "azurerm_number_of_databases" {
  default = 1
}
variable "azurerm_sql_elasticpool_name" {
}
variable "azurerm_database_name" {
}
variable "azurerm_app_db_server_list" {
  default = {}
}
variable "azurerm_sql_elasticpool_list" {
  default = {}
}
variable "azurerm_single_database_list" {
    type = list(map(map(string)))
    description = "resource group properties"
}

locals {
  azurerm_total_bytes = 1073741824 // 1GB

  azurerm_db_server_name_suffix = {
    for k, v in var.azurerm_single_database_list :
      k => v.db_server_data.azurerm_db_server_suffix == "" ? "${k<10?"0":""}${k+1}" : "${v.db_server_data.azurerm_db_server_suffix}"
  }

  azurerm_db_server_name_list = {
    for k, v in var.azurerm_single_database_list :
      k => v.db_server_data.azurerm_db_server_exists == "true" ? v.db_server_data.azurerm_db_server_name : "${var.azurerm_db_server_name_new}-${local.azurerm_db_server_name_suffix[k]}"
  }

  azurerm_create_elasticpool_name_suffix = {
    for k, v in var.azurerm_single_database_list :
      k => v.db_server_elastic_pool_data.azurerm_elastic_pool_suffix == "" ? "${k<10?"0":""}${k+1}" : "${v.db_server_elastic_pool_data.azurerm_elastic_pool_suffix}"
  }

  azurerm_elasticpool_name_list = {
    for k, v in var.azurerm_single_database_list :
      k => v.db_server_elastic_pool_data.azurerm_elastic_pool_exists == "true" && v.db_server_elastic_pool_data.azurerm_elastic_pool_blocked_to_use == "false" ? v.db_server_elastic_pool_data.azurerm_elastic_pool_name : "${var.azurerm_sql_elasticpool_name}-${local.azurerm_create_elasticpool_name_suffix[k]}"
  }

  // NEW
  azurerm_create_database_map = {
      for k, v in var.azurerm_single_database_list :
        k => merge(v.database_data,
          {
            // Uma lista com o nome dos bancos são injetadas em um map de dados
            server_name       = v.db_server_data.azurerm_db_server_exists == "true" ? v.db_server_data.azurerm_db_server_name : var.azurerm_app_db_server_list[local.azurerm_db_server_name_list[k]]
            // Uma lista com o nome dos elastics pools são injetadas em um map de dados
            elastic_pool_name = v.db_server_elastic_pool_data.azurerm_elastic_pool_exists == "true" && v.db_server_elastic_pool_data.azurerm_elastic_pool_blocked_to_use == "false" ? v.db_server_elastic_pool_data.azurerm_elastic_pool_name : v.db_server_elastic_pool_data.azurerm_elastic_pool_blocked_to_use == "false" ? var.azurerm_sql_elasticpool_list[local.azurerm_elasticpool_name_list[k]] : ""
          }
        )
  }

  azurerm_create_database_without_elasticpoll_map = {
    for k, v in local.azurerm_create_database_map :
      k => v
        if v.elastic_pool_name == "" // Sem elastic pool
  }

  azurerm_create_database_with_elasticpoll_map = {
    for k, v in local.azurerm_create_database_map :
      k => v
        if v.elastic_pool_name != "" // Com elastic pool
  }

  azurerm_create_database_name_suffix = {
    for k, v in local.azurerm_create_database_map :
      k => v.azurerm_database_suffix == "" ? "${k<10?"0":""}${k+1}" : "${v.azurerm_database_suffix}"
  }
}

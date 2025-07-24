resource "azurerm_sql_database" "main" {

  for_each                          = local.azurerm_create_database_without_elasticpoll_map

  name                              = "${var.azurerm_database_name}-${local.azurerm_create_database_name_suffix[each.key]}"
  server_name                       = each.value.server_name
  collation                         = each.value.azurerm_database_collation
  edition                           = each.value.azurerm_database_edition
  max_size_bytes                    = each.value.azurerm_database_edition != "Basic" ? each.value.azurerm_database_max_size_bytes : local.azurerm_total_bytes
  requested_service_objective_name  = each.value.azurerm_database_edition != "Basic" ? each.value.azurerm_database_requested_service_objective_name : null

  resource_group_name               = var.azurerm_resource_group_name
  location                          = var.azurerm_db_server_location
}

resource "azurerm_sql_database" "main-ep" {
  for_each                          = local.azurerm_create_database_with_elasticpoll_map

  name                              = "${var.azurerm_database_name}-${local.azurerm_create_database_name_suffix[each.key]}"
  server_name                       = each.value.server_name
  collation                         = each.value.azurerm_database_collation
  edition                           = each.value.azurerm_database_edition
  max_size_bytes                    = each.value.azurerm_database_edition != "Basic" ? each.value.azurerm_database_max_size_bytes : local.azurerm_total_bytes
  requested_service_objective_name  = each.value.azurerm_database_edition != "Basic" ? each.value.azurerm_database_requested_service_objective_name : null

  elastic_pool_name                 = each.value.elastic_pool_name
  resource_group_name               = var.azurerm_resource_group_name
  location                          = var.azurerm_db_server_location
}
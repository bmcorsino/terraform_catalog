resource "azurerm_sql_elasticpool" "main" {
  for_each            = local.azurerm_use_elastic_map

  name                = "${local.pool_name}-${local.azurerm_create_elasticpool_name_suffix[each.key]}"
  server_name         = each.value.server_name
  edition             = each.value.azurerm_elastic_pool_edition
  dtu                 = each.value.azurerm_elastic_pool_dtu
  db_dtu_min          = local.db_dtu_min
  db_dtu_max          = each.value.azurerm_elastic_pool_dtu_max
  pool_size           = each.value.azurerm_elastic_pool_dtu_size

  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_db_server_location
}
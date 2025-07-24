resource "azurerm_cosmosdb_sql_container" "main" {
    for_each            = "${local.azurerm_create_cosmosdb_map}"

    name                = "${var.azurerm_cosmosdb_container_name}-${each.key<10?"0":""}${each.key+1}"
    resource_group_name = "${var.azurerm_resource_group_name}"
    account_name        = "${each.value.account_data.azurerm_cosmosdb_account_exists == "false" ? "${var.azurerm_cosmosdb_account_name}-${each.key<10?"0":""}${each.key+1}" : each.value.account_data.azurerm_cosmosdb_account_name}"

    database_name       = "${var.azurerm_cosmosdb_database_name}-${each.key<10?"0":""}${each.key+1}"

    throughput          = "${var.throughput}"
    partition_key_path  = "${each.value.sql_container_data.azurerm_cosmosdb_partition_key_path}"

    dynamic "unique_key" { // somente se nao tiver lista informada
        for_each = length(compact(local.azurerm_unique_key_list[each.key])) == 0 ? []: compact(local.azurerm_unique_key_list[each.key])

        content {
            paths = local.azurerm_unique_key_list[each.key]
        }
    }
}
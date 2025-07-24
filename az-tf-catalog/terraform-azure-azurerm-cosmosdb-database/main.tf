resource "azurerm_cosmosdb_sql_database" "main" {
    for_each            = "${local.azurerm_create_cosmosdb_map}"

    name                = "${var.azurerm_cosmosdb_database_name}-${each.key<10?"0":""}${each.key+1}"
    resource_group_name = "${var.azurerm_resource_group_name}"

    account_name        = "${each.value.account_data.azurerm_cosmosdb_account_exists == "false" ? "${var.azurerm_cosmosdb_account_name}-${each.key<10?"0":""}${each.key+1}" : each.value.account_data.azurerm_cosmosdb_account_name}"

    throughput          = "${var.throughput}"
}
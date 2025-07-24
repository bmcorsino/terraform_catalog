resource "azurerm_mssql_server" "main" {
    for_each                        = local.azurerm_single_database_map

    name                            = "${var.azurerm_db_server_name}-${local.azurerm_db_server_name_suffix[each.key]}"
    administrator_login             = each.value.azurerm_db_server_administrator_login
    administrator_login_password    = each.value.azurerm_db_server_administrator_login_password

    tags                            = var.azurerm_db_database_tags
    version                         = var.azurerm_db_server_version
    resource_group_name             = var.azurerm_resource_group_name
    location                        = var.azurerm_db_server_location
}
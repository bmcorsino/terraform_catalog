data "azuread_client_config" "current" {}

data "azuread_user" "main" {
    for_each            = local.mysql_active_directory_administrator_map

    user_principal_name = each.value.azuread_user
}

resource "azurerm_mysql_active_directory_administrator" "main" {
    for_each            = local.mysql_active_directory_administrator_map

    server_name         = each.value.server_name
    resource_group_name = var.azurerm_resource_group_name
    login               = each.value.login
    object_id           = data.azuread_user.main[each.key].object_id
    tenant_id           = data.azuread_client_config.current.client_id

    depends_on          = [var.azurerm_resource_depends_on]
}
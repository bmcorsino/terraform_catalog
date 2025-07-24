resource "azurerm_mssql_server" "main" {
    count                        = var.azurerm_mssql_server_count
    name                         = var.name
    resource_group_name          = var.azurerm_resource_group_name
    location                     = var.azurerm_location
    version                      = var.db_version
    administrator_login          = var.administrator_login
    administrator_login_password = var.administrator_login_password
    public_network_access_enabled= tobool(var.public_network_access_enabled)
    minimum_tls_version          = var.minimum_tls_version
    tags                         = var.tags

    dynamic "azuread_administrator" {
        for_each = length(var.azuread_administrator) == 0 ? [] : [var.azuread_administrator]

        content {
          login_username = azuread_administrator.value.login_username
          object_id      = azuread_administrator.value.object_id
        }
    }
}
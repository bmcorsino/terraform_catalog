data "azuread_client_config" "current" {}

data "azuread_user" "main" {
    user_principal_name = var.azuread_user
}

resource "azurerm_postgresql_active_directory_administrator" "main" {
    server_name         = var.server_name
    resource_group_name = var.azurerm_resource_group_name
    login               = var.login
    object_id           = data.azuread_user.main.object_id
    tenant_id           = data.azuread_client_config.current.client_id

    depends_on          = [var.azurerm_resource_depends_on]
}
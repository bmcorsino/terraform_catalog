resource "azurerm_postgresql_server" "main" {
    name                             = var.azurerm_postgresql_server_name
    location                         = var.azurerm_postgresql_server_location
    resource_group_name              = var.azurerm_postgresql_server_resource_group_name

    sku_name                         = var.azurerm_postgresql_server_sku_name

    storage_mb                       = var.azurerm_postgresql_server_storage_profile_storage_mb
    backup_retention_days            = var.azurerm_postgresql_server_storage_profile_backup_retention_days
    geo_redundant_backup_enabled     = var.azurerm_postgresql_server_storage_profile_backup_geo_redundant_enabled
    auto_grow_enabled                = var.azurerm_postgresql_server_storage_profile_auto_grow_enabled

    administrator_login              = var.azurerm_postgresql_server_administrator_login_user
    administrator_login_password     = var.azurerm_postgresql_server_administrator_login_password
    version                          = var.azurerm_postgresql_server_version
    ssl_enforcement_enabled          = var.azurerm_postgresql_server_ssl_enforcement_enabled
    public_network_access_enabled    = var.azurerm_postgresql_server_public_network_access_enabled
    tags                             = var.azurerm_postgresql_server_tags
    ssl_minimal_tls_version_enforced = var.azurerm_postgresql_server_ssl_minimal_tls_version_enforced
}
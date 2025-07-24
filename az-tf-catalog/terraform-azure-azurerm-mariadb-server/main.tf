resource "azurerm_mariadb_server" "main" {
    name                              = var.azurerm_mariadb_server_name
    sku_name                          = var.azurerm_mariadb_server_sku_name
    auto_grow_enabled                 = tobool(var.azurerm_mariadb_server_auto_grow_enabled)
    storage_mb                        = var.azurerm_mariadb_server_storage_size_mb
    backup_retention_days             = var.azurerm_mariadb_server_backup_retention_days
    geo_redundant_backup_enabled      = tobool(var.azurerm_mariadb_server_geo_redundant_backup_enabled)
    public_network_access_enabled     = tobool(var.azurerm_mariadb_server_public_network_access_enabled)
    administrator_login               = var.azurerm_mariadb_server_administrator_login_user
    administrator_login_password      = var.azurerm_mariadb_server_administrator_login_password
    version                           = var.azurerm_mariadb_server_version
    ssl_enforcement_enabled           = var.azurerm_mariadb_server_ssl_enforcement_enabled
    create_mode                       = var.azurerm_mariadb_server_create_mode
    location                          = var.azurerm_db_server_location
    resource_group_name               = var.azurerm_resource_group_name
    tags                              = var.tags
}
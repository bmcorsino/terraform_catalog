resource "azurerm_postgresql_flexible_server" "main" {
    name                             = var.azurerm_postgresql_flexible_server_name
    location                         = var.azurerm_postgresql_flexible_server_location
    resource_group_name              = var.azurerm_postgresql_flexible_server_resource_group_name

    sku_name                         = var.azurerm_postgresql_flexible_server_sku_name

    storage_mb                       = var.azurerm_postgresql_flexible_server_storage_profile_storage_mb
    backup_retention_days            = var.azurerm_postgresql_flexible_server_storage_profile_backup_retention_days
    geo_redundant_backup_enabled     = var.azurerm_postgresql_flexible_server_storage_profile_backup_geo_redundant_enabled

    administrator_login              = var.azurerm_postgresql_flexible_server_administrator_login
    administrator_password           = var.azurerm_postgresql_flexible_server_administrator_password
    version                          = var.azurerm_postgresql_flexible_server_version
    tags                             = var.azurerm_postgresql_flexible_server_tags
    zone                             = var.azurerm_postgresql_flexible_server_zone
    delegated_subnet_id              = var.azurerm_postgresql_flexible_server_delegated_subnet_id
    private_dns_zone_id              = var.azurerm_postgresql_flexible_server_private_dns_zone_id

    depends_on                      = [var.azurerm_resource_depends_on]
}

resource "azurerm_postgresql_flexible_server_database" "main" {
    for_each        = local.databases

    name            = trimspace(each.value)
    server_id       = azurerm_postgresql_flexible_server.main.id
    collation       = "en_US.utf8"
    charset         = "utf8"
}
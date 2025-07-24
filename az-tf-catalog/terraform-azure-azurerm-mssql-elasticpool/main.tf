resource "azurerm_mssql_elasticpool" "main" {
    count               = var.elasticpool_count
    name                = var.name
    server_name         = var.server_name
    resource_group_name = var.azurerm_resource_group_name
    location            = var.azurerm_location
    license_type        = var.license_type
    max_size_gb         = tonumber(var.max_size_gb)
    zone_redundant      = tobool(var.zone_redundant)

    sku {
        name     = var.sku_name
        tier     = var.sku_tier
        family   = var.sku_family != "" ? var.sku_family : null
        capacity = tonumber(var.sku_capacity)
    }

    per_database_settings {
        min_capacity = var.per_database_settings_min_capacity
        max_capacity = var.per_database_settings_max_capacity
    }

    tags                = var.tags
    depends_on          = [var.azurerm_resource_depends_on]
}
resource "azurerm_mssql_database" "main" {
    count                               = var.azurerm_database_standard_count
    name                                = var.azurerm_database_name
    server_id                           = var.azurerm_server_id
    collation                           = var.azurerm_database_collation
    # If not exists ElasticPoll_ID we use parameter NULL
    elastic_pool_id                     = var.azurerm_elastic_pool_id

    max_size_gb                         = var.azurerm_database_max_size_gb
    min_capacity                        = var.azurerm_database_min_capacity
    read_replica_count                  = var.azurerm_database_read_replica_count
    read_scale                          = tobool(var.azurerm_database_read_scale)
    sku_name                            = var.azurerm_database_sku_name
    license_type                        = var.azurerm_database_license_type

    dynamic "threat_detection_policy" {
        for_each = length(var.azurerm_database_threat_detection_policy) == 0 ? [] : [var.azurerm_database_threat_detection_policy]

        content {
            state                      = lookup(threat_detection_policy.value, "state", "Enabled")
            email_addresses            = split(",", lookup(threat_detection_policy.value, "email_addresses", null))
            retention_days             = lookup(threat_detection_policy.value, "retention_days", "30")
            storage_account_access_key = lookup(threat_detection_policy.value, "storage_account_access_key", null)
            storage_endpoint           = lookup(threat_detection_policy.value, "storage_endpoint", null)
        }
    }

    zone_redundant                      = tobool(var.azurerm_database_zone_redundant)
    tags                                = var.tags
    depends_on                          = [var.azurerm_resource_depends_on]
}
resource "azurerm_mssql_database" "main_serveless" {
    count                               = var.azurerm_database_serveless_count
    name                                = var.azurerm_database_name
    server_id                           = var.azurerm_server_id
    collation                           = var.azurerm_database_collation
    # If not exists ElasticPoll_ID we use parameter NULL
    elastic_pool_id                     = var.azurerm_elastic_pool_id

    max_size_gb                         = var.azurerm_database_max_size_gb
    min_capacity                        = var.azurerm_database_min_capacity
    read_replica_count                  = var.azurerm_database_read_replica_count
    read_scale                          = tobool(var.azurerm_database_read_scale)
    sku_name                            = var.azurerm_database_sku_name
    #license_type                        = var.azurerm_database_license_type
    # Serveless
    auto_pause_delay_in_minutes         = var.azurerm_database_auto_pause_delay_in_minutes

    dynamic "threat_detection_policy" {
        for_each = length(var.azurerm_database_threat_detection_policy) == 0 ? [] : [var.azurerm_database_threat_detection_policy]

        content {
            state                      = lookup(threat_detection_policy.value, "state", "Enabled")
            email_addresses            = split(",", lookup(threat_detection_policy.value, "email_addresses", null))
            retention_days             = lookup(threat_detection_policy.value, "retention_days", "30")
            storage_account_access_key = lookup(threat_detection_policy.value, "storage_account_access_key", null)
            storage_endpoint           = lookup(threat_detection_policy.value, "storage_endpoint", null)
        }
    }

    zone_redundant                     = tobool(var.azurerm_database_zone_redundant)
    tags                               = var.tags
    depends_on                         = [var.azurerm_resource_depends_on]
}
resource "azurerm_mssql_database" "main_dw" {
    count                               = var.azurerm_database_dw_count
    name                                = var.azurerm_database_name
    server_id                           = var.azurerm_server_id
    collation                           = var.azurerm_database_collation

    min_capacity                        = var.azurerm_database_min_capacity
    sku_name                            = var.azurerm_database_sku_name
    license_type                        = var.azurerm_database_license_type

    dynamic "threat_detection_policy" {
        for_each = length(var.azurerm_database_threat_detection_policy) == 0 ? [] : [var.azurerm_database_threat_detection_policy]

        content {
            state                      = lookup(threat_detection_policy.value, "state", "Enabled")
            email_addresses            = split(",", lookup(threat_detection_policy.value, "email_addresses", null))
            retention_days             = lookup(threat_detection_policy.value, "retention_days", "30")
            storage_account_access_key = lookup(threat_detection_policy.value, "storage_account_access_key", null)
            storage_endpoint           = lookup(threat_detection_policy.value, "storage_endpoint", null)
        }
    }

    tags                               = var.tags
    depends_on                         = [var.azurerm_resource_depends_on]
}
resource "azurerm_mssql_database" "main_elastic_dtu" {
    count                               = var.azurerm_database_elastic_dtu_count
    name                                = var.azurerm_database_name
    server_id                           = var.azurerm_server_id
    collation                           = var.azurerm_database_collation
    # If not exists ElasticPoll_ID we use parameter NULL
    elastic_pool_id                     = var.azurerm_elastic_pool_id

    min_capacity                        = var.azurerm_database_min_capacity
    read_replica_count                  = var.azurerm_database_read_replica_count
    read_scale                          = tobool(var.azurerm_database_read_scale)
    sku_name                            = var.azurerm_database_sku_name
    license_type                        = var.azurerm_database_license_type

    dynamic "threat_detection_policy" {
        for_each = length(var.azurerm_database_threat_detection_policy) == 0 ? [] : [var.azurerm_database_threat_detection_policy]

        content {
            state                      = lookup(threat_detection_policy.value, "state", "Enabled")
            email_addresses            = split(",", lookup(threat_detection_policy.value, "email_addresses", null))
            retention_days             = lookup(threat_detection_policy.value, "retention_days", "30")
            storage_account_access_key = lookup(threat_detection_policy.value, "storage_account_access_key", null)
            storage_endpoint           = lookup(threat_detection_policy.value, "storage_endpoint", null)
        }
    }

    zone_redundant                     = tobool(var.azurerm_database_zone_redundant)
    tags                               = var.tags
    depends_on                         = [var.azurerm_resource_depends_on]
}
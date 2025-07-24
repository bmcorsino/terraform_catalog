
resource "azurerm_storage_account" "main" {
    for_each                        = local.azurerm_create_storage_account_map

    name                            = each.value.name
    resource_group_name             = var.azurerm_resource_group_name
    location                        = var.azurerm_resource_location

    tags                            = var.azurerm_storage_account_tags
    account_tier                    = each.value.account_tier # Premium , Standard
    account_replication_type        = each.value.account_replication_type #LRS, GRS, RAGRS and ZRS.
    access_tier                     = each.value.access_tier
    enable_https_traffic_only       = lookup(each.value, "enable_https_traffic_only", false)
    account_kind                    = each.value.account_kind
    nfsv3_enabled                   = lookup(each.value, "nfsv3_enabled", false)
    is_hns_enabled                  = each.value.is_hns_enabled
    min_tls_version                 = each.value.min_tls_version
    allow_nested_items_to_be_public = tobool(each.value.allow_nested_items_to_be_public)

    network_rules {
        default_action             = "Deny"
        ip_rules                   = []
        virtual_network_subnet_ids = []
        bypass                     = ["AzureServices"]
    }

    dynamic "blob_properties" {
        for_each = tobool(each.value.is_hns_enabled) == true || contains(["FileStorage"], each.value.account_kind) ? [] : [each.value.is_hns_enabled]

        content {
            delete_retention_policy {
                days = each.value.blob_delete_retention_policy_days
            }
        }
    }
}

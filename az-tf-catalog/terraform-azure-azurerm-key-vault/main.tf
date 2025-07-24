resource "azurerm_key_vault" "main" {
    name                        = var.azurerm_key_vault_name
    location                    = var.azurerm_key_vault_location
    resource_group_name         = var.azurerm_key_vault_resource_group_name
    enabled_for_disk_encryption = tobool(var.azurerm_key_vault_enabled_for_disk_encryption)
    tenant_id                   = var.azurerm_key_vault_tenant_id
    purge_protection_enabled    = tobool(var.azurerm_key_vault_purge_protection_enabled)
    sku_name                    = var.azurerm_key_vault_sku_name

    #access policy
    dynamic "access_policy" {
        for_each = var.azurerm_key_vault_access_policy_list

        content {
            tenant_id               = lookup(access_policy.value, "tenant_id", null)
            object_id               = lookup(access_policy.value, "object_id", null)
            application_id          = lookup(access_policy.value, "application_id", null)
            key_permissions         = lookup(access_policy.value, "key_permissions", [])
            secret_permissions      = lookup(access_policy.value, "secret_permissions", [])
            storage_permissions     = lookup(access_policy.value, "storage_permissions", [])
            certificate_permissions = lookup(access_policy.value, "certificate_permissions", [])
        }
    }

    dynamic "network_acls" {
        for_each = var.azurerm_key_vault_network_acls_list

        content {
            default_action              = lookup(network_acls.value, "default_action", "Deny")
            bypass                      = lookup(network_acls.value, "bypass", "AzureServices")
            ip_rules                    = lookup(network_acls.value, "ip_rules", [])
        }
    }
    tags                    = var.azurerm_key_vault_tags
    depends_on              = [var.azurerm_resource_depends_on]
}
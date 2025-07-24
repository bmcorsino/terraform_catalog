resource "azurerm_analysis_services_server" "main" {
    for_each                    = local.azurerm_analysis_services_server_map

    name                        = "${var.azurerm_analysis_services_server_name}${local.azurerm_analysis_services_server_suffix_name[each.key]}"
    location                    = var.azurerm_analysis_services_server_location
    resource_group_name         = var.azurerm_analysis_services_server_resource_group_name
    sku                         = each.value.sku
    admin_users                 = each.value.admin_users
    enable_power_bi_service     = tobool(each.value.enable_power_bi_service)
    querypool_connection_mode   = each.value.querypool_connection_mode
    backup_blob_container_uri   = each.value.backup_blob_container_uri != "" ? each.value.backup_blob_container_uri : null 

    #firewall rules - check content variable
    dynamic "ipv4_firewall_rule" {
        for_each = each.value.ipv4_firewall_rule

        content {
            name            = ipv4_firewall_rule.value.name
            range_start     = ipv4_firewall_rule.value.range_start
            range_end       = ipv4_firewall_rule.value.range_end
        }
    }
    tags         = var.azurerm_analysis_services_server_tags
    depends_on   = [var.azurerm_resource_depends_on]
}
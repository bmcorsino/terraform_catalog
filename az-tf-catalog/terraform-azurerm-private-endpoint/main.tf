resource "azurerm_private_endpoint" "main" {
    for_each                        = local.azurerm_private_endpoint_service_map

    name                            = "${var.azurerm_private_endpoint_name_prefix}${local.azurerm_private_endpoint_service_role_env[each.key]}-privatelink${local.azurerm_private_endpoint_service_role[each.key]}-${local.azurerm_private_endpoint_service_suffix[each.key]}"
    location                        = var.azurerm_resource_location
    resource_group_name             = var.azurerm_resource_group_name
    subnet_id                       = each.value.private_endpoint_subnet_id

    private_service_connection {
        name                           = each.value.private_service_connection_name
        is_manual_connection           = false
        private_connection_resource_id = each.value.private_connection_resource_id
        subresource_names              = [each.value.private_endpoint_subresource_name]
    }

    dynamic "private_dns_zone_group" {
        for_each = length(lookup(each.value, "private_dns_zone", "")) == 0 ? [] : [each.value.private_dns_zone]

        content {
            # VALIDAR QUANDO USUÁRIO NÃO INFORMAR O NOME DO RECURSO
            name = length(lookup(each.value, "private_dns_zone_record_set_name", "")) == 0 ? local.hostname : each.value.private_dns_zone_record_set_name
            private_dns_zone_ids = ["${local.private_dns_zone_ids}${private_dns_zone_group.value}"]
        }
    }

    tags    = lookup(each.value, "private_endpoint_tags", {})

    timeouts {
        read   = "30m"
    }

    depends_on            = [var.azurerm_resource_depends_on]
}
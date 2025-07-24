resource "azurerm_application_insights" "main" {
    for_each                    = local.azurerm_application_insights_map

    name                        = each.value.name
    location                    = var.azurerm_application_insights_location
    resource_group_name         = var.azurerm_application_insights_resource_group_name
    application_type            = each.value.application_type
    retention_in_days           = each.value.retention_in_days
    depends_on                  = [var.azurerm_resource_depends_on]
    tags                        = var.azurerm_application_insights_tags
}

resource "azurerm_application_insights_api_key" "main" {
    for_each                    = local.azurerm_application_insights_map_key

    name                        = "${each.value.name}-permissions-api-key"
    application_insights_id     = local.azurerm_application_insights_created[each.value.name].id
    read_permissions            = lookup(each.value.insights_api_key, "read_permissions", [])
    write_permissions           = lookup(each.value.insights_api_key, "write_permissions", [])

    depends_on                  = [azurerm_application_insights.main]
}
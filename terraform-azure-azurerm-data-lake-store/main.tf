resource "azurerm_data_lake_store" "main" {
    for_each                = local.azurerm_create_data_lake_list

    name                    = "${var.azurerm_data_lake_name}${each.value.role}${local.suffix[each.key]}"
    resource_group_name     = var.azurerm_data_lake_resource_group_name
    location                = var.azurerm_data_lake_location
    tier                    = each.value.tier
    encryption_state        = each.value.encryption_state
    encryption_type         = each.value.encryption_type
}
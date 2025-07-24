//TODO: ir ao portal -> Firewall and virtual networks: Allow access from Portal se necessario
resource "azurerm_cosmosdb_account" "main" {
  for_each                  = local.azurerm_create_cosmosdb_map

  name                      = each.value.name
  location                  = var.azurerm_cosmosdb_account_location
  resource_group_name       = var.azurerm_resource_group_name
  offer_type                = each.value.azurerm_cosmosdb_account_offer
  kind                      = each.value.azurerm_cosmosdb_account_kind

  enable_automatic_failover = var.enable_failover

  dynamic "capabilities" {
    for_each = each.value.azurerm_cosmosdb_account_capabilities == "" ? [] : [each.value.azurerm_cosmosdb_account_capabilities]

    content {
      name            = capabilities.value
    }
  }

  dynamic "geo_location" {
    for_each = split(",", each.value.azurerm_cosmosdb_account_failover_location)

    content {
      location          = geo_location.value
      failover_priority = geo_location.key
    }
  }

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = var.max_interval_in_seconds
    max_staleness_prefix    = var.max_staleness_prefix
  }

  is_virtual_network_filter_enabled = each.value.azurerm_cosmosdb_subnet_list == "" ? false : true

  dynamic "virtual_network_rule" {
    for_each = each.value.azurerm_cosmosdb_subnet_list == "" ? [] : split(",", each.value.azurerm_cosmosdb_subnet_list)

    content {
      id = virtual_network_rule.value
    }
  }
  tags         = var.azurerm_cosmosdb_account_tags
  depends_on   = [var.azurerm_resource_depends_on]
}
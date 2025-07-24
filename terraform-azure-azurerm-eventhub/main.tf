resource "azurerm_eventhub_namespace" "main_namespace"{
  for_each            = local.azurerm_create_eventhub_map

  name                = each.value.namespace_name
  location            = var.azurerm_resource_location
  resource_group_name = var.azurerm_resource_group_name
  sku                 = each.value.azurerm_eventhub_sku
  capacity            = each.value.azurerm_eventhub_capacity

  tags                = var.azurerm_eventhub_tags
}

resource "azurerm_eventhub" "main"{
  for_each            = local.azurerm_eventhub_list_name

  name                = each.value
  namespace_name      = local.azurerm_create_eventhub_map.0.namespace_name
  resource_group_name = var.azurerm_resource_group_name
  partition_count     = var.azurerm_eventhub_partition_count
  message_retention   = var.azurerm_eventhub_message_retention

  depends_on = [
    azurerm_eventhub_namespace.main_namespace
  ]
}
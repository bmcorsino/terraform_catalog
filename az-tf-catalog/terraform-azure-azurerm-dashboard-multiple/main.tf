resource "azurerm_dashboard" "main" {
  for_each = local.dashboard_map

  name                = "${each.value.0.resource_group_name}-dashboard"
  resource_group_name = each.value.0.resource_group_name
  location            = each.value.0.location

  dashboard_properties = templatefile(
    "${path.module}${var.azurerm_dashboard_path_from_module}", {
      resource_objects = each.value
    }
  )
  tags = local.dashboard_tags_map[each.value.0.resource_group_name].0
}

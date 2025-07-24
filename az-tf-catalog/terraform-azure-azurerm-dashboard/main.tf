resource "azurerm_dashboard" "main" {
  count                         = var.azurerm_dashboard_name_if_exists == "" ? 1 : 0
  name                          = var.azurerm_dashboard_name
  location                      = var.azurerm_dashboard_resource_group_location
  resource_group_name           = var.azurerm_dashboard_resource_group_name

  dashboard_properties = templatefile(
    "${path.module}${var.azurerm_dashboard_path_from_module}", {
      resource_objects = local.dashboard_map
    }
  )
  tags = var.azurerm_dashboard_tags
}

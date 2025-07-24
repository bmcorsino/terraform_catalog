resource "azurerm_container_registry" "main" {
  name                 = var.azurerm_container_registry_name
  location             = var.azurerm_container_registry_location
  resource_group_name  = var.azurerm_container_registry_resource_group_name
  admin_enabled        = var.azurerm_container_registry_admin_enabled
  sku                  = var.azurerm_container_registry_sku
  tags                 = var.azurerm_container_registry_tags
}
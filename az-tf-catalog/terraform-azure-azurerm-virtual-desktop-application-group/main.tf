resource "azurerm_virtual_desktop_application_group" "main" {
  location              = var.location
  resource_group_name   = var.resource_group_name
  name                  = var.name
  type                  = var.type
  host_pool_id          = var.host_pool_id
  friendly_name         = var.friendly_name
  tags                  = var.tags
  depends_on            = [var.azurerm_resource_depends_on]
}
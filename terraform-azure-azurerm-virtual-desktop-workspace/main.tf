resource "azurerm_virtual_desktop_workspace" "main" {
  name                = var.name
  friendly_name       = var.friendly_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  depends_on          = [var.azurerm_resource_depends_on]
}
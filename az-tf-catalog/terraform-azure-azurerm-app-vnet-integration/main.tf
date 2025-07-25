resource "azurerm_app_service_virtual_network_swift_connection" "main" {
  app_service_id = var.app_service_id
  subnet_id      = var.subnet_id
  depends_on     = [var.azurerm_resource_depends_on]
}
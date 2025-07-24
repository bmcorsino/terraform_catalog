resource "azurerm_logic_app_workflow" "main" {
  count               = var.azurerm_numbers_logic_app

  name                = "${var.azurerm_app_service_name}-${count.index + local.autoincrement < 10 ? "0" : ""}${count.index + local.autoincrement}"
  location            = var.azurerm_app_service_location
  resource_group_name = var.azurerm_resource_group_name

  workflow_schema     = var.azurerm_app_service_workflow_schema
  workflow_version    = var.azurerm_app_service_workflow_version
  parameters          = var.azurerm_app_service_app_parameters
  tags                = var.tags
  depends_on          = [var.azurerm_resource_depends_on]
}
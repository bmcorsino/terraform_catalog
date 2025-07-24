resource "azurerm_service_plan" "main" {
  name                         = "${var.azurerm_app_service_plan_name}"
  location                     = "${var.azurerm_app_service_plan_location}"
  resource_group_name          = "${var.azurerm_app_service_plan_resource_group_name}"
  os_type                         = "${var.azurerm_app_service_plan_os_type}"
  reserved                     = "${var.azurerm_app_service_plan_reserved}"
  maximum_elastic_worker_count = "${local.azurerm_app_service_plan_maximum_elastic_worker_count}"
  sku_name                        = "${var.azurerm_app_service_plan_sku_name}"
  tags   = "${var.azurerm_app_service_plan_tags}"
}
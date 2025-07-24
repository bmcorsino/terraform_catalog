resource "azurerm_logic_app_trigger_http_request" "main" {
  count         = "${var.azurerm_app_trigger_enabled == true ? 1 : 0}"
  name          = "${var.azurerm_app_trigger_name}"
  logic_app_id  = "${var.azurerm_app_logic_app_id}"
  method        = "${var.azurerm_app_trigger_method}"
  relative_path = "${var.azurerm_app_trigger_relative_path}"
  schema        = <<SCHEMA
${var.azurerm_app_trigger_schema}
SCHEMA
}
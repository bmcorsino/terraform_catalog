resource "azurerm_logic_app_trigger_recurrence" "main" {
  count        = "${var.azurerm_app_trigger_enabled == true ? 1 : 0}"
  name         = "${var.azurerm_app_trigger_name}"
  logic_app_id = "${var.azurerm_app_logic_app_id}"
  frequency    = "${var.azurerm_app_trigger_frequency}"
  interval     = "${var.azurerm_app_trigger_interval}"
}
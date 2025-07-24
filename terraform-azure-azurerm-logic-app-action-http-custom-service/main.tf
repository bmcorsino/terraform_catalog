resource "azurerm_logic_app_action_custom" "main" {
  count         = "${var.azurerm_app_action_enabled == true ? 1 : 0}"
  name          = "${var.azurerm_app_action_name}"
  logic_app_id  = "${var.azurerm_app_logic_app_id}"
  body        = <<BODY
${var.azurerm_app_action_body}
BODY
}
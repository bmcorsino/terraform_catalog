resource "azurerm_automation_account" "main" {
    name                = "${var.azurerm_automation_account_name}"
    location            = "${var.azurerm_automation_account_location}"
    resource_group_name = "${var.azurerm_resource_group_name}"
    sku_name            = "${var.azurerm_automation_account_sku}"
    tags                = "${var.azurerm_automation_account_tags}"
}
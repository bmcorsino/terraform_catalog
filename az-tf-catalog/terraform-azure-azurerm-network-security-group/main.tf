resource "azurerm_network_security_group" "main" {
  name                = "${var.azurerm_network_security_group_name}"
  location            = "${var.azurerm_network_security_group_location}"
  resource_group_name = "${var.azurerm_network_security_group_resource_group_name}"
  tags                = "${var.azurerm_network_security_group_tags}"
}

resource "azurerm_network_security_rule" "main" {
  name                        = "${var.azurerm_network_security_rule_name}"
  priority                    = "${var.azurerm_network_security_rule_priority}"
  direction                   = "${var.azurerm_network_security_rule_direction}"
  access                      = "${var.azurerm_network_security_rule_access}"
  protocol                    = "${var.azurerm_network_security_rule_protocol}"
  source_port_range           = "${var.azurerm_network_security_rule_source_port_range}"
  destination_port_range      = "${var.azurerm_network_security_rule_destination_port_range}"
  source_address_prefix       = "${var.azurerm_network_security_rule_source_address_prefix}"
  destination_address_prefix  = "${var.azurerm_network_security_rule_destination_address_prefix}"
  resource_group_name         = "${var.azurerm_network_security_rule_resource_group_name}"
  network_security_group_name = "${var.azurerm_network_security_rule_network_security_group_name}"
}

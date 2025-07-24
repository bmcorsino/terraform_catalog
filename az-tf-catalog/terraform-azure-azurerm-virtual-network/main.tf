resource "azurerm_virtual_network" "main" {
  name                = "${var.azurerm_virtual_network_name}"
  location            = "${var.azurerm_virtual_network_location}"
  resource_group_name = "${var.azurerm_virtual_network_resource_group}"
  address_space       = "${var.azurerm_virtual_network_address_spaces}"

  dynamic "subnet" {
    for_each = var.azurerm_subnet_prefixes

    content {
      name              = "${var.azurerm_subnet_name}-${replace(subnet.value, "/", "_")}"
      address_prefix    = subnet.value
    }
  }
}
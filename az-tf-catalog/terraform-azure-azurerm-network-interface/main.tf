resource "azurerm_network_interface" "main" {
  count                         = var.azurerm_network_interface_count
  name                          = "${var.azurerm_network_interface_name}${count.index + local.autoincrement < 10 ? "0" : ""}${count.index + local.autoincrement}${var.azure_virtual_machine_multi_node_type}"
  location                      = var.azurerm_network_interface_resource_group_location
  resource_group_name           = var.azurerm_network_interface_resource_group_name
  enable_accelerated_networking = var.azurerm_network_interface_enable_accelerated_networking

  ip_configuration {
    name                          = "${var.azurerm_network_interface_ip_configuration_name}${count.index + local.autoincrement < 10 ? "0" : ""}${count.index + local.autoincrement}${var.azure_virtual_machine_multi_node_type}"
    subnet_id                     = var.azurerm_network_interface_ip_configuration_subnet_id
    private_ip_address_allocation = var.azurerm_network_interface_ip_configuration_private_ip_address_allocation
    private_ip_address            = var.azurerm_network_interface_ip_configuration_private_ip_address
    public_ip_address_id          = var.azurerm_network_interface_ip_configuration_public_ip_address_id
  }

  tags = var.azurerm_network_interface_tags
}

resource "azurerm_network_interface_security_group_association" "main" {
  count                         = var.azurerm_network_interface_network_security_group_id != "" ? var.azurerm_network_interface_count : 0

  network_interface_id          = azurerm_network_interface.main[count.index].id
  network_security_group_id     = var.azurerm_network_interface_network_security_group_id
}

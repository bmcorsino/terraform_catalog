
provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
}

data "azurerm_virtual_network" "vnet" {
  name                  = "${var.vnet_name}"
  resource_group_name   = "${data.azurerm_resource_group.rg.name}"
}

data "azurerm_subnet" "subnet" {
  name                      = "${var.subnet_names[count.index]}"
  virtual_network_name      = "${data.azurerm_virtual_network.vnet.name}"
  resource_group_name       = "${data.azurerm_resource_group.rg.name}"
  count                     = "${length(var.subnet_names)}"
}

resource "azurerm_network_security_group" "nsg"{
    name                = "net-shared-nsg"
    location            = "${data.azurerm_resource_group.rg.location}"
    resource_group_name = "${data.azurerm_resource_group.rg.name}"
}

  resource "azurerm_network_security_rule" "nsg_inbound"{
  name                        = "Allow all inbound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.rg.name}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}
resource "azurerm_network_security_rule" "nsg_outbound"{
  name                        = "Allow all outbound"
  priority                    = 101
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "${data.azurerm_resource_group.rg.name}"
  network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = "${data.azurerm_subnet.subnet[count.index].id}"
  network_security_group_id = "${azurerm_network_security_group.nsg.id}"
  count                     = "${length(var.subnet_names)}"
}
provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${var.resource_group_name}"
  address_space       = "${var.address_space}"
  dns_servers         = "${var.dns_servers}"
}

resource "azurerm_subnet" "subnet" {
  name                      = "${var.subnet_names[count.index]}"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  resource_group_name       = "${data.azurerm_resource_group.rg.name}"
  address_prefix            = "${var.subnet_prefixes[count.index]}"
  count                     = "${length(var.subnet_names)}"
}
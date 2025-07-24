provider "azurerm" {
  version = "=2.2.0"
  features {}
}

data "azurerm_resource_group" "rg" {
  name      = "${var.resource_group_name}"
}

data "azurerm_virtual_network" "vnet" {
  name                  = "${var.vnet_name}"
  resource_group_name   = "${data.azurerm_resource_group.rg.name}"
}

data "azurerm_subnet" "subnet" {
  name                  = "${var.subnet_name}"
  virtual_network_name  = "${data.azurerm_virtual_network.vnet.name}"
  resource_group_name   = "${data.azurerm_resource_group.rg.name}"
}

resource "azurerm_route_table" "rt" {
  name                          = "${var.route_table_name}"
  location                      = "${data.azurerm_resource_group.rg.location}"
  resource_group_name           = "${data.azurerm_resource_group.rg.name}"
  disable_bgp_route_propagation = false

  route {
    name                    = "${var.route_names[count.index]}"
    address_prefix          = "${var.route_adress_prefixes[count.index]}"
    next_hop_type           = "${var.route_next_hop_types[count.index]}"
    next_hop_in_ip_address  = "${var.route_next_hop_in_ip_address[count.index]}"
  }
}

resource "azurerm_subnet_route_table_association" "example" {
  subnet_id      = "${data.azurerm_subnet.subnet.id}"
  route_table_id = "${azurerm_route_table.rt.id}"
}
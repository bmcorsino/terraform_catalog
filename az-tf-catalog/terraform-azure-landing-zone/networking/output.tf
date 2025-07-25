output "vnet_name" {
  description = "The Name of the newly created vNet"
  value       = "${azurerm_virtual_network.vnet.name}"
}
output "vnet_address_space" {
  description = "The address space of the newly created vNet"
  value       = "${azurerm_virtual_network.vnet.address_space}"
}

output "vnet_subnets" {
  description = "The ids of subnets created inside the newl vNet"
  value       = "${azurerm_subnet.subnet.*.name}"
}
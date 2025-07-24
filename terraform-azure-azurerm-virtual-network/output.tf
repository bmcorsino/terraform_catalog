output "azurerm_virtual_network_id" {
  description = "Virtual network ID"
  value       = "${azurerm_virtual_network.main.*.id}"
}

output "azurerm_virtual_network_name" {
  description = "Virtual network name"
  value       = "${azurerm_virtual_network.main.*.name}"
}

output "azurerm_virtual_network_location" {
  description = "Virtual network resource group name"
  value       = "${azurerm_virtual_network.main.*.location}"
}

output "azurerm_virtual_network_address_space" {
  description = "Virtual network address space"
  value       = "${azurerm_virtual_network.main.*.address_space}"
}

output "azurerm_virtual_network_subnet" {
  description = "Virtual network subnet"
  value       = "${azurerm_virtual_network.main.*.subnet}"
}
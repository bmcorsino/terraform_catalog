output "azurerm_network_interface_id" {
  description = "Network Interface ID"
  value       = azurerm_network_interface.main.*.id
}
output "azurerm_network_interface_mac_address" {
  description = "Network Interface Mac Address"
  value       = azurerm_network_interface.main.*.mac_address
}
output "azurerm_network_interface_private_ip_address" {
  description = "Network Interface private IP address"
  value       = azurerm_network_interface.main.*.private_ip_address
}
output "azurerm_network_interface" {
  description = "Network Interface"
  value       = azurerm_network_interface.main
}


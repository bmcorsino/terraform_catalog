output "azurerm_network_security_group_id" {
  description = "Network Security Group ID"
  value       = "${azurerm_network_security_group.main.id}"
}

output "azurerm_network_security_group_name" {
  description = "Network Security Group name"
  value       = "${azurerm_network_security_group.main.name}"
}

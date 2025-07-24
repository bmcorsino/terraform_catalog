output "azurerm_network_security_rule_id" {
  description = "Network Security Rule ID"
  value       = "${azurerm_network_security_rule.main.id}"
}

output "azurerm_subnet_id" {
  description = "Subnet ID"
  value       = azurerm_subnet.main.*.id
}
output "azurerm_subnet_name" {
  description = "Subnet name"
  value       = azurerm_subnet.main.*.name
}
output "azurerm_subnet_prefixes" {
  description = "Subnet address space"
  value       = azurerm_subnet.main.*.address_prefixes
}
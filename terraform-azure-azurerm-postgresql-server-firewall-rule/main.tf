resource "azurerm_postgresql_firewall_rule" "main" {
  name                     = var.azurerm_postgresql_server_firewall_rule_name
  resource_group_name      = var.azurerm_postgresql_server_firewall_rule_resource_group_name
  server_name              = var.azurerm_postgresql_server_firewall_rule_server_name
  start_ip_address         = var.azurerm_postgresql_server_firewall_rule_start_ip_address
  end_ip_address           = var.azurerm_postgresql_server_firewall_rule_end_ip_address
}
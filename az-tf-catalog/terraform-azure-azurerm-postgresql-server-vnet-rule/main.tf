resource "azurerm_postgresql_virtual_network_rule" "main" {
  name                                 = var.azurerm_postgresql_server_vnet_rule_name
  resource_group_name                  = var.azurerm_postgresql_server_vnet_rule_resource_group_name
  server_name                          = var.azurerm_postgresql_server_vnet_rule_server_name
  subnet_id                            = var.azurerm_postgresql_server_vnet_rule_subnet_id
  ignore_missing_vnet_service_endpoint = var.azurerm_postgresql_server_vnet_rule_ignore_missing_vnet_service_endpoint
}
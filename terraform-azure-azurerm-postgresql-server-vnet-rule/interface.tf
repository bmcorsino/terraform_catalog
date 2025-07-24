variable "azurerm_postgresql_server_vnet_rule_name" {
  description = "Azure PostgreSQL virtual network rule name"
}

variable "azurerm_postgresql_server_vnet_rule_resource_group_name" {
  description = "Azure PostgreSQL virtual network rule resource group name"
}

variable "azurerm_postgresql_server_vnet_rule_server_name" {
  description = "Azure PostgreSQL virtual network rule server name"
}

variable "azurerm_postgresql_server_vnet_rule_subnet_id" {
  description = "Azure PostgreSQL virtual network rule subnet id"
}

variable "azurerm_postgresql_server_vnet_rule_ignore_missing_vnet_service_endpoint" {
  description = "Azure PostgreSQL virtual network rule ignore missing vnet service endpoint"
  default = true
}

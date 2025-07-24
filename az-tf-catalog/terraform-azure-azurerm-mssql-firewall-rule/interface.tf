variable "azurerm_mssql_firewall_rule_list" {
    default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
  azurerm_mssql_firewall_rule_map = {
    for k, v in var.azurerm_mssql_firewall_rule_list :
      k => v
  }
}
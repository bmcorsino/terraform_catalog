resource "azurerm_mssql_firewall_rule" "main" {
  for_each            = local.azurerm_mssql_firewall_rule_map

  name                = each.value.name
  server_id           = each.value.server_id
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address

  depends_on          = [var.azurerm_resource_depends_on]
}
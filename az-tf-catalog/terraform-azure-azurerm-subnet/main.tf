resource "azurerm_subnet" "main" {
  name                 = var.azurerm_subnet_names[count.index]
  resource_group_name  = var.azurerm_subnet_resource_group_name
  virtual_network_name = var.azurerm_subnet_virtual_network_name
  address_prefixes     = var.azurerm_subnet_prefixes[count.index]

  dynamic "delegation" {
      for_each = var.azurerm_subnet_delegation

      content {
          name  = delegation.value.name
          service_delegation {
            name    = delegation.value.service_delegation.name
            actions = delegation.value.service_delegation.actions
          }
      }
  }

  count                = length(var.azurerm_subnet_names)
}

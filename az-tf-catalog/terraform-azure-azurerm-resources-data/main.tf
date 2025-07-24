data "azurerm_resources" "main" {
  name                = lookup(var.azurerm_resources_map, "name", null)
  resource_group_name = lookup(var.azurerm_resources_map, "resource_group_name", null)
  type                = lookup(var.azurerm_resources_map, "type", null)

  required_tags       = var.azurerm_required_tags
}

/*
name -                (Optional) The name of the Resource.
resource_group_name - (Optional) The name of the Resource group where the Resources are located.
type -                (Optional) The Resource Type of the Resources you want to list (e.g. Microsoft.Network/virtualNetworks). A full list of available Resource Types can be found here.
required_tags -       (Optional) A mapping of tags which the resource has to have in order to be included in the result.
*/

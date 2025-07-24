resource "azurerm_resource_group" "main" {
  for_each = local.azurerm_resource_group_merged_map

  name        = each.key
  location    = each.value.location
  tags        = local.azurerm_resource_group_merged_tags_map[each.key]
  depends_on  = [var.azurerm_resource_depends_on]

  lifecycle {
    prevent_destroy = true
  }
}
/*
https://www.terraform.io/docs/providers/azurerm/r/resource_group.html
name      - (Required) The name of the resource group. Must be unique on your Azure subscription.
location  - (Required) The location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table.
tags      - (Optional) A mapping of tags to assign to the resource.
*/

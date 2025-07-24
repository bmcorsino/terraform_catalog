data "azuread_group" "main" {
  for_each = local.azuread_objects_map
  
  name = each.value.name
}

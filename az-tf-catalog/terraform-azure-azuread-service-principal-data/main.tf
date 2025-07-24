data "azuread_service_principal" "main" {
  for_each = local.azuread_objects_map

  display_name = each.value.name
}

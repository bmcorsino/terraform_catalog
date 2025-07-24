data "azuread_user" "main" {
  for_each = local.azuread_objects_map

  user_principal_name = each.value.name
}

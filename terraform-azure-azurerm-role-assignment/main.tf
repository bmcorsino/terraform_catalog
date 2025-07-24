resource "azurerm_role_assignment" "main" {
  for_each             = var.azurerm_role_assignment_array_dashboard_exists == false ? var.azurerm_role_assignment_principal_map : {}

  principal_id         = each.value.object_id

  scope                = var.azurerm_role_assignment_resource_map[
      {
          for i, u in var.azurerm_role_assignment_array : 
            "${var.azurerm_role_assignment_array[i].resource}<=>${var.azurerm_role_assignment_array[i].name}"
                => u
                    if 
                        "${u.resource}<=>${u.name}" == each.key
      }[each.key].resource 
  ].id

  role_definition_name = {
        for i, u in var.azurerm_role_assignment_array : 
            "${var.azurerm_role_assignment_array[i].resource}<=>${var.azurerm_role_assignment_array[i].name}"
                => u
                    if 
                        "${u.resource}<=>${u.name}" == each.key
  }[each.key].role
}
/*
https://www.terraform.io/docs/providers/azurerm/r/role_assignment.html
scope                            - (Required) The scope at which the Role Assignment applies to, such as /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333, /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup, or /subscriptions/0b1f6471-1bf0-4dda-aec3-111122223333/resourceGroups/myGroup/providers/Microsoft.Compute/virtualMachines/myVM, or /providers/Microsoft.Management/managementGroups/myMG. Changing this forces a new resource to be created.
principal_id                     - (Required) The ID of the Principal (User, Group, Service Principal, or Application) to assign the Role Definition to. Changing this forces a new resource to be created.
name                             - (Optional) A unique UUID/GUID for this Role Assignment - one will be generated if not specified. Changing this forces a new resource to be created.
role_definition_id               - (Optional) The Scoped-ID of the Role Definition. Changing this forces a new resource to be created. Conflicts with role_definition_name.
role_definition_name             - (Optional) The name of a built-in Role. Changing this forces a new resource to be created. Conflicts with role_definition_id.
skip_service_principal_aad_check - (Optional) If the principal_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag. This argument is only valid if the principal_id is a Service Principal identity. If it is not a Service Principal identity it will cause the role assignment to fail. Defaults to false. 
*/
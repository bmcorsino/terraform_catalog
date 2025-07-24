resource "azurerm_management_lock" "resource-group-level" {
    for_each        = var.azure_azurerm_management_lock_scope_map

    name            = var.azure_azurerm_management_lock_name
    scope           = each.value.id
    lock_level      = var.azure_azurerm_management_lock_level
    notes           = var.azure_azurerm_management_lock_notes
}
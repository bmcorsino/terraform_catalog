resource "azurerm_machine_learning_workspace" "main" {
    for_each                    = local.azurerm_machine_learning_workspace_map

    name                        = "${var.azurerm_machine_learning_workspace_name_prefix}${each.value.role!=""?"-${each.value.role}":""}-mlw-${local.azurerm_machine_learning_workspace_suffix_name[each.key]}"
    location                    = var.azurerm_machine_learning_workspace_location
    resource_group_name         = var.azurerm_machine_learning_workspace_resource_group_name
    application_insights_id     = each.value.application_insights_id
    key_vault_id                = each.value.key_vault_id
    storage_account_id          = each.value.storage_account_id

    identity {
        type = var.identity
    }
    depends_on              = [var.azurerm_resource_depends_on]
    tags                    = var.azurerm_machine_learning_workspace_tags
}
resource "azurerm_role_definition" "main" {
    for_each                        = "${local.azurerm_role_definition_map}"

    name                            = "${each.value.name}_${var.azurerm_role_suffix}"
    scope                           = "${var.azurerm_subscription}"
    description                     = "This is a custom role created via Terraform"

    permissions {
        actions                     = "${split(",", each.value.actions)}"
        not_actions                 = []
    }

    assignable_scopes = [
        "${var.azurerm_subscription}", # /subscriptions/00000000-0000-0000-0000-000000000000
    ]
}
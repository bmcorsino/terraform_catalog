resource "azurerm_api_management" "main" {
    for_each            = "${local.azurerm_create_api_management_map}"

    name                = "${var.azurerm_api_management_name}-${each.key<10?"0":""}${each.key+1}"
    location            = "${var.azurerm_api_management_resource_group_name}"
    resource_group_name = "${var.azurerm_api_management_location}"
    publisher_name      = "${each.value.publisher_name}"
    publisher_email     = "${each.value.publisher_email}"

    sku_name            = "${each.value.sku_name}"

    identity {
        type = "${each.value.managed_identity_type}"
    }
}
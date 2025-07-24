resource "azurerm_storage_share" "main" {
    for_each                = "${local.azurerm_create_storage_share_map}"

    name                    = "${var.azurerm_storage_share_name}${each.key<10?"0":""}${each.key+1}"
    storage_account_name    = "${var.azurerm_storage_account_name}"
    quota                   = "${each.value.quota}"
}
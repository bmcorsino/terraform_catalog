resource "azurerm_storage_container" "main" {
  count                 = length(var.azurerm_storage_container_list)

  name                  = var.azurerm_storage_container_list[count.index]
  storage_account_name  = var.azurerm_storage_account_name
  container_access_type = var.container_access_type

  depends_on            = [var.azurerm_resource_depends_on]
}
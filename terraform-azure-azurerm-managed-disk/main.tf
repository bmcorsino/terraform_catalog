resource "azurerm_managed_disk" "main" {
  name                 = var.azurerm_managed_disk_name
  location             = var.azurerm_managed_disk_location
  resource_group_name  = var.azurerm_managed_disk_resource_group_name
  storage_account_type = var.azurerm_managed_disk_storage_account_type
  create_option        = var.azurerm_managed_disk_create_option
  disk_size_gb         = var.azurerm_managed_disk_disk_size_gb
  tags                 = var.azurerm_managed_disk_tags
}
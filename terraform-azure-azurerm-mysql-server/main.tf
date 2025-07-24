resource "azurerm_mysql_server" "main" {
  name                              = var.name
  sku_name                          = var.sku_name
  auto_grow_enabled                 = tobool(var.auto_grow_enabled)

  storage_mb                        = var.storage_mb
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = tobool(var.geo_redundant_backup_enabled)
  infrastructure_encryption_enabled = tobool(var.infrastructure_encryption_enabled)
  public_network_access_enabled     = tobool(var.public_network_access_enabled)

  administrator_login               = var.administrator_login
  administrator_login_password      = var.administrator_login_password
  version                           = var.db_version

  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced

  location                          = var.azurerm_db_server_location
  resource_group_name               = var.azurerm_resource_group_name
  tags                              = var.tags
}
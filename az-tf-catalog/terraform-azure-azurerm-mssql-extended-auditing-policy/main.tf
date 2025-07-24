resource "azurerm_mssql_server_extended_auditing_policy" "main" {
  count                                   = var.auditing_policy_count
  server_id                               = var.server_id
  storage_endpoint                        = var.storage_endpoint
  storage_account_access_key              = var.storage_account_access_key
  storage_account_access_key_is_secondary = tobool(var.storage_account_access_key_is_secondary)
  retention_in_days                       = tonumber(var.retention_in_days)
  depends_on                              = [var.azurerm_resource_depends_on]
}
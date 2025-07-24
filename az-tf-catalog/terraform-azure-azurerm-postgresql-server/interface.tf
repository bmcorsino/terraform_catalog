variable "azurerm_postgresql_server_name" {
  description = "Azure PostgreSQL server name"
}

variable "azurerm_postgresql_server_location" {
  description = "Azure PostgreSQL server location"
}

variable "azurerm_postgresql_server_resource_group_name" {
  description = "Azure PostgreSQL server resource group"
}

variable "azurerm_postgresql_server_sku_name" {
  description = "Azure PostgreSQL server sku name"
  default     = "GP_Gen5_2"
}

variable "azurerm_postgresql_server_storage_profile_storage_mb" {
  description = "Azure PostgreSQL server storage mb"
  default     = 102400
}

variable "azurerm_postgresql_server_storage_profile_backup_retention_days" {
  description = "Azure PostgreSQL storage backup retention days"
  default     = 7
}

variable "azurerm_postgresql_server_storage_profile_backup_geo_redundant_enabled" {
  description = "Azure PostgreSQL storage backup geo redundant is enabled"
  default     = false
}

variable "azurerm_postgresql_server_administrator_login_user" {
  description = "Azure PostgreSQL server administrator login user"
  default     = "psqladminun"
}

variable "azurerm_postgresql_server_administrator_login_password" {
  description = "Azure PostgreSQL server administrator login password"
  default     = "H@Sh1CoR3!"
}

variable "azurerm_postgresql_server_version" {
  description = "Azure Postgresql server value"
  default     = "11"
}

variable "azurerm_postgresql_server_ssl_enforcement_enabled" {
  description = "Azure PostgreSQL ssl enforcement is enabled"
  default     = true
}

variable "azurerm_postgresql_server_public_network_access_enabled" {
  description = "Azure Postgresql public network access is enabled"
  default     = false
}

variable "azurerm_postgresql_server_ssl_minimal_tls_version_enforced" {
  default     = "TLS1_2"
}

variable "azurerm_postgresql_server_tags" {
  description = "Azure Postgresql tags"
  default = {
    Environment = ""
  }
}

variable "azurerm_postgresql_server_storage_profile_auto_grow_enabled" {
  default     = true
}
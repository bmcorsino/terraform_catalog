variable "azurerm_postgresql_flexible_server_name" {
  description = "Azure PostgreSQL server name"
}

variable "azurerm_postgresql_flexible_server_location" {
  description = "Azure PostgreSQL server location"
}

variable "azurerm_postgresql_flexible_server_resource_group_name" {
  description = "Azure PostgreSQL server resource group"
}

variable "azurerm_postgresql_flexible_server_sku_name" {
  description = "Azure PostgreSQL server sku name"
  default     = "Standard_B1ms"
}

variable "azurerm_postgresql_flexible_server_storage_profile_storage_mb" {
  description = "Azure PostgreSQL server storage mb"
  default     = 102400
}

variable "azurerm_postgresql_flexible_server_storage_profile_backup_retention_days" {
  description = "Azure PostgreSQL storage backup retention days"
  default     = 7
}

variable "azurerm_postgresql_flexible_server_storage_profile_backup_geo_redundant_enabled" {
  description = "Azure PostgreSQL storage backup geo redundant is enabled"
  default     = false
}

variable "azurerm_postgresql_flexible_server_administrator_login" {
  description = "Azure PostgreSQL server administrator login user"
  default     = "psqladminun"
}

variable "azurerm_postgresql_flexible_server_administrator_password" {
  description = "Azure PostgreSQL server administrator login password"
  default     = "H@Sh1CoR3!"
}

variable "azurerm_postgresql_flexible_server_version" {
  description = "Azure Postgresql server value"
  default     = "12"
}

variable "azurerm_postgresql_flexible_server_tags" {
  description = "Azure Postgresql tags"
  default = {
    Environment = ""
  }
}

variable "azurerm_postgresql_flexible_server_zone" {
  default     = "1"
}

variable "azurerm_resource_depends_on" {
  default = [""]
}

variable "azurerm_postgresql_flexible_server_delegated_subnet_id" {
  default = null
}

variable "azurerm_postgresql_flexible_server_private_dns_zone_id" {
  default = null
}

variable "azurerm_postgresql_flexible_server_databases" {
  default = ""
}

locals {
  databases = {
    for k, database in split(",", var.azurerm_postgresql_flexible_server_databases) : "${var.azurerm_postgresql_flexible_server_name}::${database}" => database
  }
}
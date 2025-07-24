variable "name" {}
variable "sku_name" {
  default = "GP_Gen5_4"
}
variable "auto_grow_enabled" {
  default = true
}
variable "storage_mb" {
  default = 640000
}
variable "backup_retention_days" {
  default = 7
}
variable "geo_redundant_backup_enabled" {
  default = true
}
variable "infrastructure_encryption_enabled" {
  default = false
}
variable "public_network_access_enabled" {
  default = false
}
variable "administrator_login" {
  default = "mysqladminun"
}
variable "administrator_login_password" {
  default = "H@Sh1CoR3!"
}
variable "db_version" {
  default = "5.7"
}
variable "ssl_enforcement_enabled" {
  default = true
}
variable "ssl_minimal_tls_version_enforced" {
  default = "TLS1_2"
}
variable "azurerm_db_server_location" {}
variable "azurerm_resource_group_name" {}
variable "tags" {
  default = {}
}
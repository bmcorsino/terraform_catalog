variable "name" {
}
variable "resource_group_name" {
}
variable "location" {
}
variable "server_name" {
}
variable "license_type" {
  default = "LicenseIncluded"
}
variable "max_size_gb" {
  default = 756
}
variable "sku_name" {
  default = "GP_Gen5"
}
variable "sku_tier" {
  default = "GeneralPurpose"
}
variable "sku_family" {
  default = "Gen5"
}
variable "sku_capacity" {
  default = 4
}
variable "per_database_settings_min_capacity" {
  default = 0.25
}
variable "per_database_settings_max_capacity" {
  default = 4
}
variable "azurerm_mssql_elastcpool_tags" {
  default = {}
}
variable "azure_mssql_elasticpool" {
  default = false
}

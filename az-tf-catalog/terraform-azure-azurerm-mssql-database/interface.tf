variable "azurerm_database_name" {}
variable "azurerm_server_id" {}
variable "azurerm_elastic_pool_id" {
  default = null
}
variable "azurerm_database_collation" {
  default = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}
variable "azurerm_database_max_size_gb" {
  default = 4
}
variable "azurerm_database_min_capacity" {
  default = 1
}
variable "azurerm_database_read_replica_count" {
  default = 0
}
variable "azurerm_database_read_scale" {
  default = false
}
variable "azurerm_database_sku_name" {
  default = "GP_Gen5_2"
}
variable "azurerm_database_license_type" {
  default = "LicenseIncluded"
}
variable "azurerm_database_threat_detection_policy" {
  default = {}
}
variable "azurerm_database_zone_redundant" {
  default = false
}
variable "azurerm_resource_depends_on" {
  default = [""]
}
variable "azurerm_database_standard_count" {
  default = 0
}
variable "azurerm_database_serveless_count" {
  default = 0
}
variable "azurerm_database_dw_count" {
  default = 0
}
variable "azurerm_database_elastic_dtu_count" {
  default = 0
}
variable "azurerm_database_auto_pause_delay_in_minutes" {
  default = 100
}
variable "tags" {
    default = {}
}
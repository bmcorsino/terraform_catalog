variable "name" {}
variable "server_name" {}
variable "azurerm_resource_group_name" {}
variable "azurerm_location" {}
variable "license_type" {
    default = "LicenseIncluded"
}
variable "max_size_gb" {
    default = 50
}
variable "zone_redundant" {
    default = false
}
variable "sku_name" {
    default = "BC_Gen5"
}
variable "sku_tier" {
    default = "BusinessCritical"
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
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "elasticpool_count" {
    default = 1
}
variable "tags" {
    default = {}
}
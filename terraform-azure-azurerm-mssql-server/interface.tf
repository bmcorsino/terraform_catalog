variable "name" {}
variable "azurerm_resource_group_name" {}
variable "azurerm_location" {}
variable "db_version" {
    default = "12.0"
}
variable "administrator_login" {
    default = "4dm1n157r470r"
}
variable "administrator_login_password" {
    default = "4-v3ry-53cr37-p455w0rd"
}
variable "public_network_access_enabled" {
    default = false
}
variable "minimum_tls_version" {
    default = "1.2"
}
variable "tags" {
    default = {}
}
variable "azuread_administrator" {
    default = {}
}
variable "azurerm_mssql_server_count" {
    default = 1
}
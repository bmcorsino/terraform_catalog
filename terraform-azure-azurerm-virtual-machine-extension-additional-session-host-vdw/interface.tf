variable "azurerm_virtual_machine_extension_appname" {
  description = "App name"
}
variable "azurerm_virtual_machine_extension_virtual_machine_id" {
  description = "Virtual machine id"
}
variable "azurerm_virtual_machine_extension_count" {
  description = "Extension count"
  default = 1
}
variable "azurerm_virtual_machine_extension_url_dsc_file_configuration" {
    default = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_7-20-2020.zip"
}
variable "azurerm_virtual_machine_extension_vdw_host_pool_name" {
}
variable "azurerm_virtual_machine_extension_vdw_host_pool_token" {
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "azurerm_virtual_machine_extension_tags" {
  default = {}
}
variable "azurerm_virtual_machine_extension_start_suffix" {
    default = 0
}
variable "autoincrement" {
    default = 1
}
locals {
    autoincrement = var.autoincrement + var.azurerm_virtual_machine_extension_start_suffix
}
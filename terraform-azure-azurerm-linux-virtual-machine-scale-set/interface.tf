variable "azurerm_scale_set_name" {
  type = string
}
variable "azurerm_scale_set_resource_group" {
  type = string
}
variable "azurerm_scale_set_region" {
  type = string
}
variable "azurerm_scale_set_sku" {
  type = string
  default = "Standard_F2"
}
variable "azurerm_scale_set_instances" {
  type = number
  default = 1
}
variable "azurerm_scale_set_admin_username" {
  type = string
}
variable "azurerm_scale_set_username" {
  type = string
}
variable "azurerm_scale_set_image_publisher" {
  type = string
  default = "Canonical"
}
variable "azurerm_scale_set_image_offer" {
  type = string
  default = "UbuntuServer"
}
variable "azurerm_scale_set_image_sku" {
  type = string
  default = "16.04-LTS"
}
variable "azurerm_scale_set_image_version" {
  type = string
  default = "latest"
}
variable "azurerm_scale_set_storage_account_type" {
  type = string
  default = "Standard_LRS"
}
variable "azurerm_scale_set_storage_account_caching" {
  type = string
  default = "ReadWrite"
}
variable "azurerm_scale_set_network_interface_name" {
  type = string
}
variable "azurerm_scale_set_network_interface_primary" {
  type = bool
  default = true
}
variable "azurerm_scale_set_network_interface_ip_name" {
  type = string
}
variable "azurerm_scale_set_network_interface_ip_primary" {
  type = bool
  default = true
}
variable "azurerm_scale_set_network_interface_ip_subnet_id" {
  type = string
}
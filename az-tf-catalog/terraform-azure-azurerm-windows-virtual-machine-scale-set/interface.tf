variable "azurerm_windows_vm_scale_name" {
  type = string
}

variable "azurerm_resource_group_name" {
  type = string
}

variable "azurerm_windows_vm_scale_location" {
  type = string
  default = "West Europe"
}

variable "azurerm_windows_virtual_machine_scale_set_sku" {
  type = string
  default = "Standard_F2"
}

variable "azurerm_windows_virtual_machine_scale_set_instances" {
  type = number
  default = 1
}

variable "azurerm_windows_virtual_machine_scale_set_admin_username" {
  type = string
}

variable "azurerm_windows_virtual_machine_scale_set_admin_password" {
  type = string
}

variable "azurerm_windows_virtual_machine_scale_set_source_image_reference_publisher" {
  type = string
  default = "MicrosoftWindowsServer"
}

variable "azurerm_windows_virtual_machine_scale_set_source_image_reference_offer" {
  type = string
  default = "WindowsServer"
}

variable "azurerm_windows_virtual_machine_scale_set_source_image_reference_sku" {
  type = string
  default = "2016-Datacenter-Server-Core"
}

variable "azurerm_windows_virtual_machine_scale_set_source_image_reference_version" {
  type = string
  default = "latest"
}

variable "azurerm_windows_virtual_machine_scale_set_os_disk_sa_type" {
  type = string
  default = "Standard_LRS"
}

variable "azurerm_windows_virtual_machine_scale_set_os_disk_caching" {
    type = string
    default = "ReadWrite"
}

variable "azurerm_network_interface_name" {
  type = string
}

variable "azurerm_ipconfig_name" {
  type = string
}

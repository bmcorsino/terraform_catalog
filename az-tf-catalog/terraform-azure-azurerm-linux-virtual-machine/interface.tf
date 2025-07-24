variable "azurerm_virtual_machine_hostname" {
  description = "Azure virtual machine hostname"
}
variable "azurerm_virtual_machine_location" {
  description = "Azure virtal machine location"
}
variable "azurerm_virtual_machine_count" {
  description = "Azure virtal machine count"
  default = 1
}
variable "azurerm_virtual_machine_resource_group_name" {
  description = "Azure virtual machine resource group"
}
variable "azurerm_virtual_machine_tags" {
  description = "Azure virtal machine  tags"
	default = {}
}
variable "azure_virtual_machine_multi_node_type" {
  description = "Azure virtal machine  multi node type"
	default = "s"
}
variable "disable_password_authentication_linux" {
  default = false
}
variable "azurerm_virtual_machine_availability_set_id" {
  description = "Azure virtual machine availability set"
  default     = ""
}
variable "azurerm_virtual_machine_size" {
  description = "Azure virtual machine size"
}
variable "azurerm_virtual_machine_network_interface_ids" {
  description = "Azure virtual machine network interfaces ids"
}
## Storage image reference variables
variable "azurerm_virtual_machine_os_publisher" {
  description = "Azure virtual machine OS publisher. Ex: Canonical."
  default = "Canonical"
}
variable "azurerm_virtual_machine_os_offer" {
  description = "Azure virtual machine OS offer. Ex: UbuntuServer"
  default = "UbuntuServer"
}
variable "azurerm_virtual_machine_os_sku" {
  description = "Azure virtual machine OS sku. Ex: 16.04-LTS"
  default = "16.04-LTS"
}
variable "azurerm_virtual_machine_os_version" {
  description = "Azure virtual machine OS version. Ex: latest"
  default     = "latest"
}

## Storage OS variables
variable "azurerm_virtual_machine_storage_os_disk_create_option" {
  description = "Azure virtual machine OS disk create option"
  default     = "FromImage"
}
variable "azurerm_virtual_machine_storage_os_disk_caching" {
  description = "Azure virtual machine OS disk caching type"
  default     = "ReadWrite"
}
variable "azurerm_virtual_machine_managed_os_disk_type" {
  description = "Azure virtual machine OS disk type"
  default     = "Standard_LRS"
}
variable "azurerm_virtual_machine_start_suffix" {
  default = 0
}
variable "autoincrement" {
  default = 1
}
variable "azurerm_virtual_machine_os_custom_image_id" {
  default = null
}
locals {
  autoincrement = var.autoincrement + var.azurerm_virtual_machine_start_suffix

  # Lista que armazena apenas posições simulando o total de VMs que podemos criar (100 posições).
  app_array_max_items_can_created = split(",", "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99")

  azurerm_vm_list_name = {
    for k, v in slice(local.app_array_max_items_can_created, 0, (tonumber(var.azurerm_virtual_machine_count) > 0 ? tonumber(var.azurerm_virtual_machine_count) : 1)) :
      k => "${var.azurerm_virtual_machine_hostname}${k + local.autoincrement < 10 ? "0" : ""}${k + local.autoincrement}${var.azure_virtual_machine_multi_node_type}"
  }
}
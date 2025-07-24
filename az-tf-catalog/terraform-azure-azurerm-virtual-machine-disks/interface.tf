variable "name" {
  default = "disk1"
}
variable "location" {
  default = "Westeurope"
}
variable "resource_group_name" {
}
variable "storage_account_type" {
  default = "Standard_LRS"
}
variable "create_option" {
  default = "Empty"
}
variable "disk_size_gb" {
  default = 10
}
variable "virtual_machine_id" {
}
variable "lun" {
  default = "10"
}
variable "caching" {
  default = "ReadWrite"
}
variable "azurerm_resource_depends_on" {
  default = [""]
}
variable "tags" {
  default = {}
}
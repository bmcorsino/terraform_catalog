variable "azurerm_managed_disk_name" {
  description = "Azure managed disk name"
}

variable "azurerm_managed_disk_location" {
  description = "Azure managed disk location"
}

variable "azurerm_managed_disk_resource_group_name" {
  description = "Azure managed disk resource group"
}

variable "azurerm_managed_disk_storage_account_type" {
  description = "Azure managed disk storage type"
  default = "Standard_LRS"
}

variable "azurerm_managed_disk_create_option" {
  description = "Azure managed disk create option"
  default = "Empty"
}

variable "azurerm_managed_disk_disk_size_gb" {
  description = "Azure managed disk size gb"
}

variable "azurerm_managed_disk_tags" {
  description = "Azure managed disk tags"
  default = {
    Environment = ""
  }
}






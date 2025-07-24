variable "azurerm_virtual_machine_extension_appname" {
  description = "App name"
}
variable "azurerm_virtual_machine_extension_domain" {
  description = "App name"
  default ="cpdprd.pt"
}

#@deprecated - Terraform 12
variable "azurerm_virtual_machine_extension_rgname" {
  description = "Storage Account resource group name"
}

variable "azurerm_virtual_machine_extension_virtual_machine_id" {
  description = "Virtual machine id"
}

variable "azurerm_virtual_machine_extension_count" {
  description = "Extension count"
  default = 1
}

#@deprecated - Terraform 12
variable "azurerm_virtual_machine_extension_location" {
  description = "VM extension location"
}
variable "azurerm_virtual_machine_extension_ou_path" {
}
variable "azurerm_virtual_machine_extension_approval" {
  description = "VM extension approval"
}

variable "azurerm_virtual_machine_extension_domain_user" {}
variable "azurerm_virtual_machine_extension_password" {}

variable "os_type" {
  description = "Specifies the operating system type."
}

variable "command" {
  default     = ""
  description = "Command to be executed."
}

variable "script" {
  default     = ""
  description = "Script to be executed."
}

variable "file_uris" {
  type        = list
  default     = []
  description = "List of files to be downloaded."
}

variable "azurerm_virtual_machine_extension_start_suffix" {
  default = 0
}

variable "autoincrement" {
  default = 1
}

variable "azurerm_resource_depends_on" {
    default = [""]
}

variable "azurerm_virtual_machine_extension_tags" {
  default = {}
}

locals {
  autoincrement = var.autoincrement + var.azurerm_virtual_machine_extension_start_suffix
}
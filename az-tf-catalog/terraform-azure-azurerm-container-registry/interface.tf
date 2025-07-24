variable "azurerm_container_registry_name" {
  description = "Azure container registry name"
}

variable "azurerm_container_registry_location" {
  description = "Azure container registry location"
}

variable "azurerm_container_registry_resource_group_name" {
  description = "Azure container registry resource group"
}

variable "azurerm_container_registry_admin_enabled" {
  description    = "Azure container registry admin user is enabled"
  type           = bool
  default        = false
}

variable "azurerm_container_registry_sku" {
  description    = "Azure container registry SKU name"
  default        = "Standard"
}

variable "azurerm_container_registry_tags" {
  description = "Azure container registry tags"
  default = {
    Environment = ""
  }
}
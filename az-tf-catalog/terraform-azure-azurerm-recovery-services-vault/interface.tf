variable "azurerm_recovery_services_vault_appname" {
  description = "App name"
}


variable "azurerm_recovery_services_vault_rgname" {
  description = "Recovery services resource group name"
}
variable "azurerm_recovery_services_vault_environment" {
  description = "Environment name"
}

variable "azurerm_recovery_services_vault_location" {
  description = "Recovery services location"
}

# Premium , Standard
variable "azurerm_recovery_services_vault_sku" {
  description = "(Required) Sets the vault's SKU. Possible values include: Standard, RS0"
  default = "Standard"
  
}


variable "azurerm_recovery_services_vault_tags" {
 description = "Resource tags to associate with our resources."
 type        = "map"
}
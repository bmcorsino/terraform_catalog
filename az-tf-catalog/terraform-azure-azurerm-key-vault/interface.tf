variable "azurerm_key_vault_location" {
    description = "Azure Key Vault location"
}
variable "azurerm_key_vault_resource_group_name" {
    description = "Azure Key Vault resource group"
}
variable "azurerm_key_vault_name" {}
variable "azurerm_key_vault_enabled_for_disk_encryption" {
  default = true
}
variable "azurerm_key_vault_purge_protection_enabled" {
  default = true
}
variable "azurerm_key_vault_sku_name" {
  default = "standard"
}
variable "azurerm_key_vault_access_policy_list" {
  default = []
}
variable "azurerm_key_vault_network_acls_list" {
  default = []
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "azurerm_key_vault_tags" {
    default = {}
}
variable "azurerm_key_vault_tenant_id" {
}
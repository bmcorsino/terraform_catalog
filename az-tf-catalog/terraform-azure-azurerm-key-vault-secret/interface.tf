variable "azurerm_key_vault_name" {
    description = "Azure Key Vault name"
}
variable "azurerm_resource_group_name" {
    description = "Azure Key Vault resource group"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "name" {}
variable "content_type" {}
variable "value" {}
variable "tags" {
    default = {}
}
variable "has_lifecycle" {
    default = false
}
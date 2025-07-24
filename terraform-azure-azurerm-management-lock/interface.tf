variable "azure_azurerm_management_lock_name" {
    default = "Delete-lock"
}
variable "azure_azurerm_management_lock_level" {
    default = "CanNotDelete"
}
variable "azure_azurerm_management_lock_notes" {
    default = "This resource can't be deleted"
}
variable "azure_azurerm_management_lock_scope_map" {
    default = {}
}
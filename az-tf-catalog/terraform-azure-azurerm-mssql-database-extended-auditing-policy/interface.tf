variable "database_id" {
}
variable "storage_endpoint" {
}
variable "storage_account_access_key" {
}
variable "storage_account_access_key_is_secondary" {
}
variable "retention_in_days" {
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "auditing_policy_count" {
    default = 1
}
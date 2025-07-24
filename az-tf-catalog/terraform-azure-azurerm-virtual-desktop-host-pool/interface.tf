variable "location" {}
variable "resource_group_name" {}
variable "name" {}
variable "friendly_name" {}
variable "validate_environment" {
    default = true
}
variable "start_vm_on_connect" {
    default = true
}
variable "custom_rdp_properties" {
    default = ""
}
variable "type" {
    default = "Pooled"
}
variable "maximum_sessions_allowed" {
    default = 50
}
variable "load_balancer_type" {
    default = "DepthFirst"
}
variable "tags" {
    default = {}
}
variable "preferred_app_group_type" {
    default = "None"
}
variable "token_expiration_date_in_days" {
    default = 0
}
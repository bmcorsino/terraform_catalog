variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "sku" {}
variable "microsoft_app_id" {}
variable "tags" {
    default = {}
}
variable "luis_app_ids" {
    default = null
}
variable "luis_key" {
    default = null
}
variable "app_insights_key" {
    default = null
}
variable "app_insights_api_key" {
    default = null
}
variable "app_insights_application_id" {
    default = null
}
variable "endpoint" {
    default = null
}
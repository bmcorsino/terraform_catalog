variable "name" {}
variable "location" {}
variable "resource_group_name" {}
variable "kind" {}
variable "sku_name" {}
variable "tags" {
    default = {}
}
variable "qna_runtime_endpoint" {
    default = null
}
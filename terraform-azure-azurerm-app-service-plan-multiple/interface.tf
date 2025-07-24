variable "name" {}
variable "location" {}
variable "resource_group_name" {
}
variable "sku_name" {
  default = "S1"
}
variable "os_type" {
  default = "Linux"
}
variable "maximum_elastic_worker_count" {
  default = null
}
variable "tags" {
  default = {}
}
variable "service_plan_standard_count" {
  default = 1
}
variable "service_plan_ase_count" {
  default = 0
}
variable "service_plan_ase_environment_id" {
  default = null
}
variable "azurerm_resource_depends_on" {
    default = [""]
}

locals {
  maximum_elastic_worker_count = contains(["EP1", "EP2", "EP3", "Y1"], var.sku_name) ? 1 : null
}
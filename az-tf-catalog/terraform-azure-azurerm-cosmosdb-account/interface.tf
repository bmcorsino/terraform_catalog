variable "azurerm_cosmosdb_account_name" {
}
variable "azurerm_resource_group_name" {
}
variable "azurerm_cosmosdb_account_location" {
}
variable "enable_failover" {
  default = true
}
variable "consistency_level" {
  default = "BoundedStaleness"
}
variable "max_interval_in_seconds" {
  default = 10
}
variable "max_staleness_prefix" {
  default = 200
}
variable "failover_priority" {
  default = 0
}
variable "azurerm_cosmosdb_list_array" {
    type = list(map(string))
}
variable "azurerm_cosmosdb_account_tags" {
    default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
  azurerm_create_cosmosdb_suffix = {
      for k, v in var.azurerm_cosmosdb_list_array :
        k => v.azurerm_cosmosdb_account_suffix != "" ? v.azurerm_cosmosdb_account_suffix : "${k < 10 ? "0" : ""}${k+1}"
  }
  azurerm_create_cosmosdb_map = {
      for k, v in var.azurerm_cosmosdb_list_array :
        k => merge(v, {name = "${var.azurerm_cosmosdb_account_name}-${local.azurerm_create_cosmosdb_suffix[k]}"} )
  }
}
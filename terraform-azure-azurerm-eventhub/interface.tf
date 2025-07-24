variable "azurerm_eventhub_name" {
    type = string
}
variable "azurerm_resource_group_name" {
    type = string
}
variable "azurerm_resource_location" {
    default = "West Europe"
    type = string
}
variable "azurerm_eventhub_namespace_name" {
    type = string
}
variable "azurerm_eventhub_capacity" {
    default = 1
    type = number
}
variable "azurerm_eventhub_message_retention" {
    default = 1
    type = number
}
variable "azurerm_eventhub_sku" {
    default = "Standard"
    type = string
}
variable "azurerm_eventhub_partition_count" {
    default = 2
    type = number
}
variable "azurerm_eventhub_tags" {
    default = {}
}
variable "azurerm_eventhub_list" {
    type = list(map(string))
}
variable eventhub_count {
    default = "1"
    type    = string
}
variable eventhub_suffix {
    default = "08"
}

locals {

    # Lista que armazena apenas posições simulando o total de VMs que podemos criar (100 posições).
    app_array_max_items_can_created = split(",", "0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99")

    azurerm_eventhub_list_name = {
      for k, v in slice(local.app_array_max_items_can_created, 0, (tonumber(var.eventhub_count) > 0 ? tonumber(var.eventhub_count) : 1)) :
        k => "${var.azurerm_eventhub_name}-${k + var.eventhub_suffix < 10 ? "0" : ""}${k + var.eventhub_suffix}"
        }

    azurerm_create_eventhub_map = {
      for k, v in var.azurerm_eventhub_list :
        k => merge(v, {namespace_name = "${var.azurerm_eventhub_namespace_name}-${var.eventhub_suffix}"}) 
    }
}
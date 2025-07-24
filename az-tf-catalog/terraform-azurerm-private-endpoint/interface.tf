variable "azurerm_private_endpoint_name_prefix" {
  description = "Prefix Name"
}
variable "azurerm_resource_group_name" {
  description = "Resource group name"
}
variable "azurerm_resource_location" {
  description = "Location"
}
variable "azurerm_private_endpoint_resource_list" {
  description = "Resource List"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
  hostname = "hostname-${replace(replace(timestamp(), "-", ""), ":", "")}"
  private_dns_zone_ids = "/subscriptions/57701fdc-da76-4568-8afe-19859ba440d5/resourceGroups/azdns-shr-rg-01/providers/Microsoft.Network/privateDnsZones/" // Fixo

  azurerm_private_endpoint_service_map = {
      for k, v in var.azurerm_private_endpoint_resource_list :
        k => v
              if v.private_endpoint_subnet_id != ""
  }
  azurerm_private_endpoint_service_role_env = {
      for k, v in var.azurerm_private_endpoint_resource_list :
        k => lookup(v, "private_endpoint_role_env", "") != "" ? "-${v.private_endpoint_role_env}" : ""
              if v.private_endpoint_subnet_id != ""
  }
  azurerm_private_endpoint_service_role = {
      for k, v in var.azurerm_private_endpoint_resource_list :
        k => v.private_endpoint_role != "" ? "-${v.private_endpoint_role}" : ""
              if v.private_endpoint_subnet_id != ""
  }
  azurerm_private_endpoint_service_suffix = {
      for k, v in var.azurerm_private_endpoint_resource_list :
        k => v.private_endpoint_suffix != "" ? v.private_endpoint_suffix : "${k < 10 ? "0" : ""}${k + 1}"
              if v.private_endpoint_subnet_id != ""
  }
}
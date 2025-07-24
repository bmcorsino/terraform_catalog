##############################################################
#This module allows the creation of a monitor action group
##############################################################


#Output for the module

output "azurerm_monitor_action_group_name" {
  value = "${azurerm_monitor_action_group.main.name}"
}


output "azurerm_monitor_action_group_resource_group_name" {
  value = "${azurerm_monitor_action_group.main.resource_group_name}"
}

output "azurerm_monitor_action_group_short_name" {
  value = "${azurerm_monitor_action_group.main.short_name}"
}


output "azurerm_monitor_action_group_is_enabled" {
  value = "${azurerm_monitor_action_group.main.enabled}"
}

output "azurerm_monitor_action_group_id" {
  value = "${azurerm_monitor_action_group.main.id}"
}


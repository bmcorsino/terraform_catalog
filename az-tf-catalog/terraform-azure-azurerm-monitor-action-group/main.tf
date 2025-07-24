##############################################################
#This module allows the creation of an Action group
##############################################################


#Creating an action group

resource "azurerm_monitor_action_group" "main" {
  name                    = "${var.azurerm_monitor_action_group_name}"
  resource_group_name     = "${var.azurerm_monitor_action_group_resource_group_name}"
  short_name              = "${var.azurerm_monitor_action_group_short_name}"
  enabled                 = "${var.azurerm_monitor_action_group_is_enabled}"

  email_receiver {
    name            = "${var.azurerm_monitor_action_group_email_receiver1}"
    email_address   = "${var.azurerm_monitor_action_group_email_receiver1_address}"
  }

}
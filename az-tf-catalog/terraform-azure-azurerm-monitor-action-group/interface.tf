##############################################################
#This module allows the creation of an action group
##############################################################

#Variable declaration for Module


#The Action Group Name
variable "azurerm_monitor_action_group_name" {
  type    = "string"

}

#The Action Group Resource Group
variable "azurerm_monitor_action_group_resource_group_name" {
  type    = "string"

}

#The Action Group Short Name
variable "azurerm_monitor_action_group_short_name" {
  type    = "string"


}

#Is the action group enabled ?
variable "azurerm_monitor_action_group_is_enabled" {
  type = "string"
  default = "true"
}


#The name of the Email Receiver 1
variable "azurerm_monitor_action_group_email_receiver1" {
  type    = "string"

}

#The email address of the Email Receiver 1
variable "azurerm_monitor_action_group_email_receiver1_address" {
  type    = "string"

}







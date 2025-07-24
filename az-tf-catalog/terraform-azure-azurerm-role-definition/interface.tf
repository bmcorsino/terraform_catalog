variable "azurerm_role_suffix" {
}
variable "azurerm_subscription" {
}

variable "azurerm_role_definition_list" {
    type = list(map(string))
    description = "role definition properties"
}
locals {
    azurerm_role_definition_map = {
        for k, v in var.azurerm_role_definition_list :
            k => {
                name    = v.name
                actions = v.actions == "" ? "*" : v.actions
            }
    }
}
variable azurerm_resource_group_array {
    type = list(map(string))
    description = "resource group properties"
}
// Resource Group tags to associate with our resources
variable azurerm_resource_group_tags_array {
    type = list(map(string))
    default     = [
    ]
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
locals {
    // arrays converted to maps
    azurerm_resource_group_tags_map = {
        for k, v in var.azurerm_resource_group_tags_array : 
            "${var.azurerm_resource_group_array[k].alias}-${var.azurerm_resource_group_array[k].environment}${var.azurerm_resource_group_array[k].sub_env}-${var.azurerm_resource_group_array[k].resource_group_name_suffix}"
                => v
    }
    azurerm_resource_group_map = {
        for k, v in var.azurerm_resource_group_array : 
            "${var.azurerm_resource_group_array[k].alias}-${var.azurerm_resource_group_array[k].environment}${var.azurerm_resource_group_array[k].sub_env}-${var.azurerm_resource_group_array[k].resource_group_name_suffix}"
                => v
    }

    // corporate enforced tags
    azurerm_resource_group_tags_policy_enforced = {
        for k, v in local.azurerm_resource_group_map : 
            k => {
                for i, u in v : 
                    i => u
                        if 
                            i == "app" ||
                            i == "bu" ||
                            i == "alias" ||
                            i == "change" ||
                            i == "description" ||
                            i == "environment" ||
                            i == "owner" ||
                            i == "project" ||
                            i == "deployment_mode" ||
                            i == "provisioning_date" ||
                            i == "state" ||
                            i == "costs"
            }
    }

    // Only Tag expiration_date
    azurerm_resource_group_additional_tags_map = {
        for k, v in local.azurerm_resource_group_map :
        k => {
            for i, u in v :
                i => u
                    if 
                        i == "expiration_date"
        }
    }

    // merging corporate enforced settings with user settings
    azurerm_resource_group_merged_map = {
        for k, v in local.azurerm_resource_group_map : 
            k => local.azurerm_resource_group_map[k]
    }

    // Check if user tags are empty
    azurerm_resource_group_consolidated_tags_map = local.azurerm_resource_group_tags_map == {} ? local.azurerm_resource_group_tags_policy_enforced : local.azurerm_resource_group_tags_map

    // merging corporate enforced tags with user tags
    azurerm_resource_group_merged_tags_map = {
        for k, v in local.azurerm_resource_group_consolidated_tags_map : 
            k => merge(
                local.azurerm_resource_group_consolidated_tags_map[k],
                local.azurerm_resource_group_tags_policy_enforced[k],
                // (increase) tag expiration_date only if not empty
                length(lookup(local.azurerm_resource_group_additional_tags_map[k], "expiration_date")) > 0 ? { "expiration_date" = lookup(local.azurerm_resource_group_additional_tags_map[k], "expiration_date")} : {}
            )
    }
}


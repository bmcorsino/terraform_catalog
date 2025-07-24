variable azurerm_template_deployment_budget_resource_group_map {
    type = map(map(string))
    description = "template deployment budget resource group properties"
}
variable azurerm_template_deployment_budget_resource_group_tags_map {
    type = list(map(string))
    description = "template deployment budget resource group tags"
}
variable azurerm_template_deployment_budget_array {
    type = list(map(string))
    description = "template deployment budget arguments"
}
variable azurerm_resource_depends_on {
    default = [""]
}
locals {
    azurerm_template_deployment_budget_resource_group_tags_map = {
        for k, v in var.azurerm_template_deployment_budget_resource_group_tags_map : 
            "${v.alias}-${v.environment}${v.sub_env}-${v.resource_group_name_suffix}"
                => {
                    alias       = v.alias
                    environment = v.environment
                    sub_env     = v.sub_env
                }
    }

    // array converted to map
    azurerm_template_deployment_budget_map = {
        for k, v in var.azurerm_template_deployment_budget_array : 
            "${var.azurerm_template_deployment_budget_array[k].resource_group_name}<=>${local.azurerm_template_deployment_budget_resource_group_tags_map[ var.azurerm_template_deployment_budget_array[k].resource_group_name ].alias}-${local.azurerm_template_deployment_budget_resource_group_tags_map[ var.azurerm_template_deployment_budget_array[k].resource_group_name ].environment}${local.azurerm_template_deployment_budget_resource_group_tags_map[ var.azurerm_template_deployment_budget_array[k].resource_group_name ].sub_env}-${var.azurerm_template_deployment_budget_array[k].template_deployment_budget_name_suffix}"
                => v
    }

    // corporate enforced settings
    azurerm_template_deployment_budget_policy_enforced = {
        azure_json_arm_template                 = "${file("${path.module}/templates/AzureBudget.json")}"
        deployment_mode                         = "Incremental"
    }
    // merging corporate enforced settings with user settings
    azurerm_template_deployment_budget_merged_map = {
        for k, v in local.azurerm_template_deployment_budget_map : 
            k => merge(local.azurerm_template_deployment_budget_map[k], local.azurerm_template_deployment_budget_policy_enforced)
    }
}

# locals {
    # // first resource group name
    # azurerm_template_deployment_budget_resource_group_name = keys(var.azurerm_template_deployment_budget_resource_group_map)[0]

#     // first resource group name
#     azurerm_template_deployment_budget_resource_group_name = keys(var.azurerm_template_deployment_budget_resource_group_map)[0]
#     // array converted to map
#     azurerm_template_deployment_budget_map = {
#         for k, v in var.azurerm_template_deployment_budget_array : 
#             "${var.azurerm_template_deployment_budget_resource_group_tags_map[ lookup(var.azurerm_template_deployment_budget_array[k], "resource_group_name", local.azurerm_template_deployment_budget_resource_group_name) ].app}-${var.azurerm_template_deployment_budget_resource_group_tags_map[ lookup(var.azurerm_template_deployment_budget_array[k], "resource_group_name", local.azurerm_template_deployment_budget_resource_group_name) ].environment}-${lookup(var.azurerm_template_deployment_budget_array[k], "template_deployment_budget_name_suffix", "budget-01") }"
#                 => v
#     }

#     // corporate enforced settings
#     azurerm_template_deployment_budget_policy_enforced = {
#         // deployment_mode                         = "Incremental"
#     }
#     // merging corporate enforced settings with user settings
#     azurerm_template_deployment_budget_merged_map = {
#         for k, v in local.azurerm_template_deployment_budget_map : 
#             k => merge(local.azurerm_template_deployment_budget_map[k], local.azurerm_template_deployment_budget_policy_enforced)
#     }
# }


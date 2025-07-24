resource "azurerm_databricks_workspace" "main" {
    for_each                = local.azurerm_create_databricks_workspace_list

    name                    = each.value.databricks_name
    resource_group_name     = var.azurerm_databricks_workspace_resource_group_name
    location                = var.azurerm_databricks_workspace_location
    sku		                = each.value.tier
    tags                    = var.azurerm_databricks_workspace_tags

    dynamic "custom_parameters" {
        for_each = length(lookup(each.value, "custom_parameters", {})) == 0 ? [] : [each.value.custom_parameters]

        content {
            public_subnet_name  = custom_parameters.value.public_subnet_name
            private_subnet_name = custom_parameters.value.private_subnet_name
            virtual_network_id  = custom_parameters.value.virtual_network_id
            public_subnet_network_security_group_association_id  = custom_parameters.value.nsg_public_network_id
            private_subnet_network_security_group_association_id = custom_parameters.value.nsg_private_network_id
        }
    }

    managed_resource_group_name = each.value.managed_resource_group_name
    depends_on                  = [var.azurerm_resource_depends_on]
}
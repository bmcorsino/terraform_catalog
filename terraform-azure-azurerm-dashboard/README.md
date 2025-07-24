# terraform-azure-azurerm-dashboard
![Image description](https://docs.microsoft.com/en-us/azure/azure-monitor/learn/media/tutorial-logs-dashboards/log-analytics-portal-dashboard.png)


## Creates the following project resources.

This Terraform module deploys a Dashboard using the specified JSON file.
The Dashboard JSON file must include Terraform directives with the data variables

```hcl

## Usage

module "dashboard"  {
    source = "../terraform-azure-azurerm-dashboard"
    azurerm_dashboard_name                                           = "${var.azurerm_resource_group_name}-dashboard"
    azurerm_dashboard_resource                                       = var.azuread_dashboard_permissions_array[*].resource
    azurerm_dashboard_resource_group_location                        = var.azure_region
    azurerm_dashboard_resource_group_name                            = var.azurerm_resource_group_name
    azurerm_dashboard_path_from_module                               = "/templates/multiple-vm-dashboard.json"
    azurerm_dashboard_object_list                                    = module.vm-teste-win.azurerm_virtual_machine
    azurerm_dashboard_tags                                           = local.tags
}
```


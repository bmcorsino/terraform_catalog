# terraform-azure-azurerm-dashboard-multiple
![Image description](https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RWrxog)


## Creates the following project resources.

This Terraform module deploys multiple Dashboards of Resource Group VMs, using the objects array and the specified JSON file.
The Dashboard JSON file must include Terraform directives with the data variables

```

## Usage

```hcl
module "dashboard"  {
    source                              = "../terraform-azure-azurerm-dashboard-multiple"
    azurerm_dashboard_resources_array   = module.custom_existing_resources.objects_output     # using output of module terraform-azure-azurerm-resources-data
    azurerm_dashboard_path_from_module  = "/templates/multiple-vm-dashboard.json"
}
```


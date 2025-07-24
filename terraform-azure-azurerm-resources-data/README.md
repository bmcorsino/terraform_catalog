# terraform-azure-azurerm-resources-data
![Image description](https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RWrxog)


## Retrives the following project resources.

This Terraform module returns all subscription objects satisfiyng the used filter criteria

```

## Usage

```hcl
module "custom_existing_resources" {
    source                      = "../terraform-azure-azurerm-resources-data"

  # Manipulate retrieving filter by Activating or Deactivating the following filter variables by changing the content
    azurerm_resources_map = {
        name                    = null                                  # example: "midazdevap1s"
        resource_group_name     = null                                  # example: "dscaz-dev-rg-01"
        type                    = "Microsoft.Compute/virtualMachines"
    }
    azurerm_required_tags = {}
}
```

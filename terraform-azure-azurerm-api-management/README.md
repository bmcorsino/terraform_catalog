# terraform-azurerm-api-management


## Create a basic api management in Azure

This Terraform module deploys a api management in Azure

## Usage

```hcl
module "api-management" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-api-management.git"

    azure_region                    = "Westeurope"
    azurerm_resource_group_name     = "my-dev-rg-01"

    environment                     = "dev" //[dev,pre,prd,shr,unm]
    sub_environment                 = "" //[bda, src, "" if not mentioned]
    app_name                        = "appname"

    api_management_list              = [
        {
                publisher_name       = "My Company"
                publisher_email      = "company@terraform.io"
                sku_name             = "Developer_1"
                managed_identity_type= "SystemAssigned" // Possible values are SystemAssigned, UserAssigned or SystemAssigned, UserAssigned
        },
        {
                publisher_name       = "My Company"
                publisher_email      = "company@terraform.io"
                sku_name             = "Developer_1"
                managed_identity_type= "UserAssigned" // Possible values are SystemAssigned, UserAssigned or SystemAssigned, UserAssigned
        }
    ]
}
```
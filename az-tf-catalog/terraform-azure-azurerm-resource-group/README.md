# terraform-azurerm-resource-group

## Create resource groups in Azure

This Terraform module deploys one or more Resource Groups in Azure with predifined tags. Other tags can also be added.

## Simple Usage

Creates one Resource Group without additional tags

```hcl
module "resource-group" {
    source           = "./terraform-azure-azurerm-resource-group"

    azurerm_resource_group_array = [
        {
            resource_group_name_suffix  = "rg-01"
            // required tags
            app                         = "appnm"           // Application Name
            environment                 = "dev"
            owner                       = "EXxxxx"
            bu                          = "DGU"
            state                       = ""
            project                     = "prjxxxx"
            change                      = ""
            provisioning_date           = "2019-10-14"     // formatdate("YYYY-MM-DD", timestamp())
            expiration_date             = "2021-10-14" # formatdate("YYYY-MM-DD", timestamp())
            description                 = "Resources dedicated to appnm in the dev environment."
            location                    = "west europe"     // Azure Region
        },
    ]
}
```

## Advanced Usage

Creates two Resource Groups with additional tags.

```hcl
module "resource-group" {
    source           = "./terraform-azure-azurerm-resource-group"

    azurerm_resource_group_array = [
        {
            resource_group_name_suffix  = "rg-01"
            // required tags
            app                         = "rgbgt"           // Application Name
            environment                 = "dev"
            owner                       = "EXxxxx"
            bu                          = "DGU"
            state                       = ""
            project                     = "prjxxxx"
            change                      = ""
            provisioning_date           = "2019-10-14" # formatdate("YYYY-MM-DD", timestamp())
            expiration_date             = "2021-10-14" # formatdate("YYYY-MM-DD", timestamp())
            description                 = "Resources dedicated to rgbgt in the dev environment."
            location                    = "west europe"     // Azure Region
        },
        {
            resource_group_name_suffix  = "rg-02"
            // required tags
            app                         = "rgbgt"           // Application Name
            environment                 = "dev"
            owner                       = "EXxxxx"
            bu                          = "DGU"
            state                       = ""
            project                     = "prjxxxx"
            change                      = ""
            provisioning_date           = "2019-10-14" # formatdate("YYYY-MM-DD", timestamp())
            expiration_date             = "2021-10-14" # formatdate("YYYY-MM-DD", timestamp())
            description                 = "Resources dedicated to rgbgt in the dev environment."
            location                    = "west europe"     // Azure Region
        },
    ]
    azurerm_resource_group_tags_array = [
        {
            userrgsometagname = "user_rg-01_some_tag_value"
        },
        {
            userrgsometagname = "user_rg-02_some_tag_value"
        },
    ]
}

```
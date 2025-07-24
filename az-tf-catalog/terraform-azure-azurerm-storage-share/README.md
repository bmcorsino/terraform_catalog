# terraform-azurerm-storage-share


## Create a basic storage share in Azure

This Terraform module deploys a storage share in Azure

## Usage

```hcl
module "storage-share" {
    source           = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-storage-share.git"

    azurerm_resource_group_name               = "${var.azurerm_resource_group_name}"

    azurerm_storage_share_name                = "${local.storage_share_name}"
    azurerm_storage_account_name              = "${var.storage_account_name}"

    storage_share_list  = [
        {
                quota               = 50 // default 50
        },
        {
                quota               = 50 // default 50
        }
    ]
}
```
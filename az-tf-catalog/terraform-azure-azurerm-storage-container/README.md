# terraform-azurerm-storage-container

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/storage_container.html

## Create a basic storage container

This Terraform module deploys a Storage Container in Azure.

## Usage

```hcl
module "azure-azurerm-storage-container" {
    source           = "../terraform-azure-azurerm-storage-container"
    azurerm_storage_container_resource_group_name    = "app-env-rg-01"
    azurerm_storage_account_name                     = "storage-account-name"
    azurerm_storage_container_list                   = ["container_name_01", "container_name_02", "container_name_03"]
}
```
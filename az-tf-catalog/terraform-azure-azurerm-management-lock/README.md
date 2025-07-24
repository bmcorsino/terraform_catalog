# terraform-azure-azurerm-management-lock

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/management_lock.html

## Create a basic Azurerm Management Lock

This Terraform module deploys a Azurerm Management Lock in Azure

## Usage

```hcl
module "azure_azurerm_management_lock" {
    source           = "../terraform-azure_azurerm_management_lock"
    azure_azurerm_management_lock_name          = "Delete-lock"
    azure_azurerm_management_lock_level         = "CanNotDelete"
    azure_azurerm_management_lock_notes         = "This resource can't be deleted"
    azure_azurerm_management_lock_scope_map     = [
        {
            id = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>"
        },
        {
            id = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Network/publicIPAddresses/XPTO-publicIP"
        }
    ]
}
```
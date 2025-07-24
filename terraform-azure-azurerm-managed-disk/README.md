# terraform-azurerm-managed-disk

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/managed_disk.html

## Create a new managed disk

This Terraform module deploys a simple EMPTY managed disk

## Usage example

# Simple Cluster without network parameters

```hcl
module "disk-01" {
  source               = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-managed-disk.git"
  name                 = "disk01"
  location             = "West Europe"
  resource_group_name  = "devops-dev-rg-01"
  disk_size_gb         = "100"
  tags                 = {
    app = xxx
  }
}
```

## Extra parameters

```hcl
# Managed disk type options: Standard_LRS(default), Premium_LRS, StandardSSD_LRS or UltraSSD_LRS. 
  azurerm_managed_disk_storage_account_type = "Standard_LRS" 
```
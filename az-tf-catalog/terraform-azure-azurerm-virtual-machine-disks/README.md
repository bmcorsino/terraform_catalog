# kpmg DISKS

DISKS delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13, 14, 15 and 1.0

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [DISKS](#DISKS)
- [Output](#output)

## DISKS<a name="DISKS"></a>
```bash
module "terraform-azure-azurerm-virtual-machine-disks" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-virtual-machine-disks.git"

    name                        = "disk1"
    location                    = "Westeurope"
    resource_group_name         = "appname-dev-rg-01"
    storage_account_type        = "Standard_LRS"
    create_option               = "Empty"
    disk_size_gb                = 10
    virtual_machine_id          = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Compute/virtualMachines/<VM-NAME>"
    lun                         = "10"
    caching                     = "ReadWrite"
    tags                        = {}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.terraform-azure-azurerm-virtual-machine-disks.main
}
```
# DXC Eventhub

Manages a Event Hubs as a nested resource within a Event Hubs namespace.

  - Terraform 14, 15

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Eventhub](#Eventhub)
- [Output](#output)

## Eventhub<a name="Eventhub"></a>
```bash
module "terraform-azure-azurerm-eventhub" {
    source                                    = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-eventhub.git"
    
    azurerm_resource_location                 = "Westeurope"
    azurerm_resource_group_name               = "my-dev-rg-01" // my-dev-rg-01
    azurerm_eventhub_name                     = "prtf"
    azurerm_eventhub_namespace_name           = "testprtf"
    azurerm_eventhub_partition_count          = 2
    azurerm_eventhub_message_retention        = 1
    azurerm_eventhub_sku                      = "Standard"
    azurerm_eventhub_capacity                 = 1
}
```
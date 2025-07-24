# terraform-azure-azurerm-virtual-machine-extension-domainjoin


## Create a virtual-machine-extension (Domain Join) associated with a specific VM

This Terraform module deploys a storage account in Azure

## Usage

```hcl
module "virtual-machine-extension-domainjoin" {
    source           = "../terraform-azure-azurerm-virtual-machine-extension"
    azurerm_virtual_machine_extension_appname                   = "appxpto01"
    azurerm_virtual_machine_extension_rgname                    = "appxpto-dev-rg-01"
    azurerm_virtual_machine_extension_domain                    = "cpdprd.pt"
    azurerm_virtual_machine_extension_location                  = "West Europe"
    azurerm_virtual_machine_extension_virtual_machine_name      = "appxptovm01"
  
}

```

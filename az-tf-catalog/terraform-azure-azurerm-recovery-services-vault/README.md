# terraform-azure-azurerm-recovery-services-vault


## Create a Recovery services vault in Azure

This Terraform module deploys a  Recovery services vault  in Azure

## Usage

```hcl
module "recovery-services-vault" {
    source           = "../terraform-azure-azurerm-recovery-services-vault"
    azurerm_recovery_services_vault_appname                   = "devops"
    azurerm_recovery_services_vault_rgname                    = "mgmt-dev-rg-01"
    azurerm_recovery_services_vault_environment               = "dev"
    azurerm_recovery_services_vault_location                  = "West Europe"
    azurerm_recovery_services_vault_sku                       = "Standard" or  "RS0"
    
        azurerm_recovery_services_vault_tags = {
        owner = "EXxxxx"
        bu  = "DGU"
        Description =" App Description..."
        Environment = "TST"
        App = "5lettercodename"  
    }
}

```
ss

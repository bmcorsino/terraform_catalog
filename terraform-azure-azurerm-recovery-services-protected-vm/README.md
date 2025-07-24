# terraform-azure-azurerm-recovery-services-protected-vm


## Create a Recovery services vault protected vm in Azure

This Terraform module deploys a  Recovery services vault protected vm in Azure

## Usage

```hcl
module "recovery-services-vault" {
    source           = "../terraform-azure-azurerm-recovery-services-vault-protected-vm"
    azurerm_recovery_services_protected_vm_vaultname          = "devops"
    azurerm_recovery_services_protected_vm_rgname             = "mgmt-dev-rg-01"
    azurerm_recovery_services_protected_vm_vmid               = "dev"
    azurerm_recovery_services_protected_vm_policyid           = "West Europe"
    
    
    
}

```
ss

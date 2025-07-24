# terraform-azure-azurerm-recovery-services-protected-vm


## Create a Recovery services vault protected VM in Azure

This Terraform module deploys a  Recovery services vault  protected vm and assigns a policy in Azure


## Usage

```hcl
module "terraform-azure-azurerm-recovery-services-protection-policy-vm" {
    source           = "../terraform-azure-azurerm-recovery-services-protection-policy-vm"
    recovery_vault_name                   = "devops"
    resource_group_name                   = "mgmt-dev-rg-01"
    source_vm_id                          = "dev-vmid"
   
  
}

```
ss

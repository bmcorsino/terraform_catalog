variable "azurerm_recovery_services_protected_vm_vaultname" {
  description = "Vault name"
}

variable "azurerm_recovery_services_protected_vm_count" {
  default = 1
}

variable "azurerm_recovery_services_protected_vm_rgname" {
  description = "Recovery services resource group name"
}
variable "azurerm_recovery_services_protected_vm_vmid" {
  description = "VM ID name"
}

variable "azurerm_recovery_services_protected_vm_policyid" {
  description = "Recovery services policy id"
}

variable "backup-policy-enable" {
  description = "0 or 1 "
  default = "0"
}
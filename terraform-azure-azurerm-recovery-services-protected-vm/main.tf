resource "azurerm_backup_protected_vm" "main" {
    count 					= var.azurerm_recovery_services_protected_vm_count

    resource_group_name     = var.azurerm_recovery_services_protected_vm_rgname
    recovery_vault_name     = var.azurerm_recovery_services_protected_vm_vaultname
    source_vm_id            = var.azurerm_recovery_services_protected_vm_vmid[count.index]
    backup_policy_id        = var.azurerm_recovery_services_protected_vm_policyid
}
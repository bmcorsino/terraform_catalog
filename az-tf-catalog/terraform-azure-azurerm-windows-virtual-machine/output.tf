output "azurerm_windows_virtual_machine_id" {
  description = "Virtual Machine ID"
  value       = azurerm_windows_virtual_machine.main.*.id
}
output "azurerm_windows_virtual_machine" {
  description = "Virtual Machine"
  value       = azurerm_windows_virtual_machine.main
}
output "azurerm_vm_name_before_create" {
  value = [
    for k, v in local.azurerm_vm_list_name :
      v
  ]
}
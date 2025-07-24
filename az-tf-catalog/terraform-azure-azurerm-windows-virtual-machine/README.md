# Windows Virtual Machine

Virtual Machine delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13, 14, 15 and 1.0

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Virtual Machine - Windows](#vm_windows)
- [Output](#output)

## Virtual Machine - Windows<a name="vm_windows"></a>
```bash
module "virtual-machine-windows" {
    source = ""
    azurerm_windows_virtual_machine_hostname                                     = "rctf_vm"
    azurerm_windows_virtual_machine_resource_group_name                          = "rctf_rg"
    azurerm_windows_virtual_machine_location                                     = "westeurope"
    azurerm_windows_virtual_machine_count                                        = 1
    azurerm_windows_virtual_machine_tags 			  			                 = {}
    azure_virtual_machine_multi_node_type				                         = "s"
    azurerm_windows_virtual_machine_availability_set_id		                     = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Compute/availabilitySets/<RESOURCE-NAME>"
    azurerm_windows_virtual_machine_vm_size                                      = "Standard_F2"
    azurerm_windows_virtual_machine_os_publisher                                 = "MicrosoftWindowsServer"
    azurerm_windows_virtual_machine_os_offer                                     = "WindowsServer"
    azurerm_windows_virtual_machine_os_sku                                       = "2016-Datacenter"
    azurerm_windows_virtual_machine_os_version                                   = "latest"
    azurerm_windows_virtual_machine_storage_os_disk_caching                      = "ReadWrite"
    azurerm_windows_virtual_machine_managed_os_disk_type                         = "Standard_LRS"
    azurerm_windows_virtual_machine_os_profile_admin_username                    = "rctf1456"
    azurerm_windows_virtual_machine_os_profile_admin_password                    = "xpto@%{!passwd" # random password 
    azurerm_windows_virtual_machine_os_profile_custom_data                       = ""
    azurerm_windows_virtual_machine_os_profile_windows_provision_vm_agent        = "true"
    azurerm_windows_virtual_machine_os_profile_windows_enable_automatic_upgrades = "false"
    azurerm_windows_virtual_machine_os_profile_windows_timezone                  = ""
    azurerm_windows_virtual_machine_start_suffix                                 = 1
    azurerm_windows_virtual_machine_license_type                                 = "Windows_Server"
    azurerm_windows_virtual_machine_network_interface_ids                        = ["/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Network/networkInterfaces/<RESOURCE-NAME>",]
    azurerm_windows_virtual_machine_os_custom_image_id                           = null 
}  
```

## Output<a name="output"></a>
```bash
output "azurerm_windows_virtual_machine_id" {
  value       = azurerm_windows_virtual_machine.main.*.id
}
output "azurerm_windows_virtual_machine" {
  value       = azurerm_windows_virtual_machine.main
}
output "azurerm_vm_name_before_create" {
  value = [
    for k, v in local.azurerm_vm_list_name :
      v
  ]
}
```
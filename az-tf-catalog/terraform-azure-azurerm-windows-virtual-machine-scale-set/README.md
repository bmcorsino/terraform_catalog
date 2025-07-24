# Windows Virtual Machine Scale Set

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

- [Virtual Machine Scale Set - Windows](#vm_windows)

## Virtual Machine Scale Set - Windows<a name="vm_windows"></a>
```bash
module "virtual-machine-windows-scale-set" {
  source = ""
  azurerm_windows_vm_scale_name                                                = "rctf_windows_scale"
  azurerm_resource_group_name                                                  = "rctf_rg"
  azurerm_windows_vm_scale_location                                            = "westeurope"
  azurerm_windows_virtual_machine_scale_set_admin_username                     = "rafa2345"
  azurerm_windows_virtual_machine_scale_set_admin_password                     = "xpto@%{!passwd" # random password "
  azurerm_windows_virtual_machine_scale_sku                                    = "Standard_F2"
  azurerm_windows_virtual_machine_scale_set_instances                          = 1
  azurerm_windows_virtual_machine_scale_set_source_image_reference_publisher   = "MicrosoftWindowsServer"
  azurerm_windows_virtual_machine_scale_set_source_image_reference_offer       = "WindowsServer"
  azurerm_windows_virtual_machine_scale_set_source_image_reference_sku         = "2016-Datacenter-Server-Core"
  azurerm_windows_virtual_machine_scale_set_source_image_reference_version     = "latest"
  azurerm_windows_virtual_machine_scale_set_os_disk_sa_type                    = "Standard_LRS"
  azurerm_windows_virtual_machine_scale_set_os_disk_caching                    = "ReadWrite"
  azurerm_ipconfig_name                                                        = "rctf_ipconfig"
  azurerm_network_interface_name                                               = ""
} 
```
# kpmg Virtual Machine

Virtual Machine delivery according to model and value combinations, below are the tested and validated examples

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

- [Virtual Machine - Linux](#vm_linux)
- [Virtual Machine - Windows](#vm_windows)
- [Output](#output)

## Virtual Machine - Linux<a name="vm_linux"></a>
```bash
module "virtual-machine" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-virtual-machine.git"

    azurerm_virtual_machine_count                               = 1
    azurerm_virtual_machine_start_suffix                        = 1
    azurerm_virtual_machine_hostname                            = "appnamedevww01s"
    azurerm_virtual_machine_location                            = "westeurope"
    azurerm_virtual_machine_resource_group_name                 = "appname-dev-rg-01"
    azurerm_virtual_machine_vm_size                             = "Standard_B2ms"
    azurerm_virtual_machine_network_interface_ids               = ["/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Network/networkInterfaces/<RESOURCE-NAME>",]
    azurerm_virtual_machine_os_publisher                        = "Canonical"
    azurerm_virtual_machine_os_offer                            = "UbuntuServer"
    azurerm_virtual_machine_os_sku                              = "16.04-LTS"
    azurerm_virtual_machine_os_custom_image_id                  = null
    azurerm_virtual_machine_os_profile_admin_username           = "appnamedevww01s"
    azurerm_virtual_machine_os_profile_admin_password           = "xpto@%{!passwd" # random password
    azurerm_virtual_machine_managed_os_disk_type                = "Standard_LRS"
    azurerm_virtual_machine_os_profile_linux_ssh_keys_key_data  = ""
    azurerm_virtual_machine_tags						                    = {}
    azurerm_virtual_machine_availability_set_id		              = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Compute/availabilitySets/<RESOURCE-NAME>"
    azure_virtual_machine_multi_node_type				                = "s"
```

## Virtual Machine - Windows<a name="vm_windows"></a>
```bash
module "virtual-machine" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-virtual-machine.git"

    azurerm_virtual_machine_count                               = 1
    azurerm_virtual_machine_start_suffix                        = 1
    azurerm_virtual_machine_hostname                            = "appnamedevww01s"
    azurerm_virtual_machine_is_windows_image                    = true
    azurerm_virtual_machine_location                            = "westeurope"
    azurerm_virtual_machine_resource_group_name                 = "appname-dev-rg-01"
    azurerm_virtual_machine_vm_size                             = "Standard_B2ms"
    azurerm_virtual_machine_license_type                        = "Windows_Server"
    azurerm_virtual_machine_network_interface_ids               = ["/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Network/networkInterfaces/<RESOURCE-NAME>",]
    azurerm_virtual_machine_os_publisher                        = "MicrosoftWindowsServer"
    azurerm_virtual_machine_os_offer                            = "WindowsServer"
    azurerm_virtual_machine_os_sku                              = "2016-Datacenter"
    azurerm_virtual_machine_os_custom_image_id                  = null
    azurerm_virtual_machine_os_profile_admin_username           = "appnamedevww01s"
    azurerm_virtual_machine_os_profile_admin_password           = "xpto@%{!passwd" # random password
    azurerm_virtual_machine_managed_os_disk_type                = "Standard_LRS"
    azurerm_virtual_machine_tags 			  			                  = {}
    azurerm_virtual_machine_availability_set_id		              = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Compute/availabilitySets/<RESOURCE-NAME>"
    azure_virtual_machine_multi_node_type				                = "s"
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.virtual-machine.azurerm_virtual_machine
}
output "azurerm_virtual_machine_id" {
  value = module.virtual-machine.azurerm_virtual_machine_id
}
```
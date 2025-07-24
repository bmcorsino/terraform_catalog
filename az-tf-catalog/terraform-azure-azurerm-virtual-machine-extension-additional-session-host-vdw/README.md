# terraform-azure-azurerm-virtual-machine-extension-additional-session-host-vdw

## Create a virtual-machine-extension associated with a Azure Virtual Desktop | Host pool
.
## Usage

```hcl
module "virtual-machine-extension-session-hosts-vwd" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-virtual-machine-extension-additional-session-host-vdw.git"

    azurerm_virtual_machine_extension_appname                 = "appname-dev-rg-01"
    azurerm_virtual_machine_extension_virtual_machine_id      = [
        {
            "/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.Compute/virtualMachines/<vm-name>"
        }
    ]
    azurerm_virtual_machine_extension_tags                    = {}
    azurerm_resource_depends_on                               = []
    azurerm_virtual_machine_extension_vdw_host_pool_name      = "<application>-<environment>-wvdpool-<seq number>"
    azurerm_virtual_machine_extension_vdw_host_pool_token     = "eyJhbGciOiJSUzI1N=="
}
```
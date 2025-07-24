# DXC VirtualDesktopHostPool

VirtualDesktopHostPool delivery according to model and value combinations, below are the tested and validated examples

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [VirtualDesktopHostPool](#VirtualDesktopHostPool)
- [Output](#output)

## VirtualDesktopHostPool<a name="VirtualDesktopHostPool"></a>
```bash
module "desktop_host_pool" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-virtual-desktop-host-pool.git"

    location                 = "Westeurope"
    resource_group_name      = "appname-dev-rg-01"
    name                     = "<application>-<environment>-wvdpool-<seq number>"
    friendly_name            = "Friendly name"
    validate_environment     = true
    start_vm_on_connect      = true
    custom_rdp_properties    = ""
    type                     = "Pooled"
    maximum_sessions_allowed = 50
    load_balancer_type       = "DepthFirst"
    preferred_app_group_type = "None"
    tags                     = {}
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.desktop_host_pool.main
}
```
# DXC VirtualDesktopWorkspace

VirtualDesktopWorkspace delivery according to model and value combinations, below are the tested and validated examples

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

- [VirtualDesktopWorkspace](#VirtualDesktopWorkspace)
- [Output](#output)

## VirtualDesktopWorkspace<a name="VirtualDesktopWorkspace"></a>
```bash
module "desktop_workspace" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-virtual-desktop-workspace.git"
    location                = "Westeurope"
    resource_group_name     = "appname-dev-rg-01"
    name                    = "<application>-<environment>-wvdworkspace-<seq number>"
    friendly_name           = "Friendly name"
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.desktop_workspace.main
}
```
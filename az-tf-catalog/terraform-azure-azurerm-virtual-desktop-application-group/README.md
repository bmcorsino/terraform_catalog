# kpmg VirtualDesktopApplicationGroup

VirtualDesktopApplicationGroup delivery according to model and value combinations, below are the tested and validated examples

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

- [kpmg VirtualDesktopApplicationGroup](#kpmg-virtualdesktopapplicationgroup)
  - [Any questions or suggestion?](#any-questions-or-suggestion)
  - [Run terraform](#run-terraform)
  - [Index](#index)
  - [VirtualDesktopApplicationGroup](#virtualdesktopapplicationgroup)
  - [Output](#output)

## VirtualDesktopApplicationGroup<a name="VirtualDesktopApplicationGroup"></a>
```bash
module "desktop_application_group" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-virtual-desktop-application-group.git"

    location                = "Westeurope"
    resource_group_name     = "appname-dev-rg-01"
    name                    = "<application>_<environment>_wvdappgroup_<seq number>"
    type                    = "RemoteApp"
    host_pool_id            = "<HOST-POOL-ID>"
    friendly_name           = "Friendly name"
    tags                    = {}
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.desktop_application_group.main
}
```
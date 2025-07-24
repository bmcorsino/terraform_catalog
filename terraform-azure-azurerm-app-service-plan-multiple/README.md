# DXC ServicePlan

ServicePlan delivery according to model and value combinations, below are the tested and validated examples

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## ServicePlan<a name="serviceplan"></a>
```bash
module "app-service-plan-multiple" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-app-service-plan-multiple.git?ref=v.2.0.0"

    service_plan_standard_count     = 1
    service_plan_ase_count          = 0
    name                            = "appname-dev-plan-01"
    sku_tier                        = "Standard"
    sku_size                        = "S1"
    sku_capacity                    = 1
    kind                            = "Linux"
    reserved                        = false
    tags                            = {key = value}
    location                        = "westeurope"
    resource_group_name             = "appname-dev-rg-01"
    service_plan_ase_environment_id = null
    azurerm_resource_depends_on     = []
}
```

## Output<a name="serviceplan-output"></a>
```bash
output "main" {
    value = module.app-service-plan-multiple.main
}
```
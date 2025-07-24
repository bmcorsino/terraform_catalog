# DXC App VNet Integration

AppVNetIntegration delivery according to model and value combinations, below are the tested and validated examples (App Service or Function App)

  - Terraform 14, 15

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [AppVNetIntegration](#AppVNetIntegration)
- [Output](#output)

## AppVNetIntegration<a name="AppVNetIntegration"></a>
```bash
module "terraform-azure-azurerm-app-vnet-integration" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-app-vnet-integration.git"

    subnet_id       = "/path-subnet-id/0.0.0.0_26"
    app_service_id  = "/path-app-service-id/appname-dev-app-or-func-01"
}
```
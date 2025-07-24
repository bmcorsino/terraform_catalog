# kpmg MSSQL

MSSQL delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 14 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## MSSQL<a name="mssql"></a>
```bash
module "mssql-server" {
    azurerm_mssql_server_count              = 1
    azurerm_resource_group_name             = "my-dev-rg-01"
    azurerm_location                        = "Westeurope"
    name                                    = "appname-dev-sql"
    db_version                              = "12.0"
    administrator_login                     = "4dm1n157r470r"
    administrator_login_password            = "4-v3ry-53cr37-p455w0rd"
    public_network_access_enabled           = false
    minimum_tls_version                     = "1.2"
    azuread_administrator                   = {}
    tags                                    = {key = value}
}
```

## Output<a name="mssql-output"></a>
```bash
output "main" {
    value = module.mssql-server.main
}
```
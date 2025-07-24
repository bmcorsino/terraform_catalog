# DXC MariaDB

MariaDB delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [MariaDB](#maria-db)
- [Output](#output)

## MariaDB<a name="maria-db"></a>
```bash
module "dxc-mariadb-server-paas" {
    source                          = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-mariadb-server.git"

    azurerm_mariadb_server_name                             = "<application>-<environment>-mariadb[-ROLE]-<seq number>"
    azurerm_mariadb_server_sku_name                         = "GP_Gen5_8"
    azurerm_mariadb_server_auto_grow_enabled                = true
    azurerm_mariadb_server_storage_size_mb                  = 5120
    azurerm_mariadb_server_backup_retention_days            = 7
    azurerm_mariadb_server_geo_redundant_backup_enabled     = true
    azurerm_mariadb_server_public_network_access_enabled    = false
    azurerm_mariadb_server_administrator_login_user         = "mariadbadmin"
    azurerm_mariadb_server_administrator_login_password     = "H@Sh1CoR3!"
    azurerm_mariadb_server_version                          = "10.2"
    azurerm_mariadb_server_ssl_enforcement_enabled          = true
    azurerm_mariadb_server_create_mode                      = "Default"
    azurerm_db_server_location                              = "Westeurope"
    azurerm_resource_group_name                             = "appname-dev-rg-01"
    tags                                                    = {key=value}
}
```

## Output<a name="output"></a>
```bash
output "main" {
    value = module.dxc-mariadb-server-paas.main
}
```
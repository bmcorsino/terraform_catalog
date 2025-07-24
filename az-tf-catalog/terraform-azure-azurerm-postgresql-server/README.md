# kpmg PostgreSQL

PostgreSQL delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14
  - Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/postgresql_server.html

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [PostgreSQL single](#postgresql-single)
- [Output](#output)

## PostgreSQL single<a name="postgresql-single"></a>
```bash
module "postgres-server" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-postgresql-server.git"

    azurerm_postgresql_server_name                          = "server-name"
    azurerm_postgresql_server_location                      = "Westeurope"
    azurerm_postgresql_server_resource_group_name           = "devops-shr-rg-01"
    azurerm_postgresql_server_sku_name                      = "GP_Gen5_2"
    azurerm_postgresql_server_storage_profile_storage_mb    = "102400"
    azurerm_postgresql_server_administrator_login_user      = "admin"
    azurerm_postgresql_server_administrator_login_password  = ""
    azurerm_postgresql_server_version                       = "10"
}
```

## PostgreSQL single - extra fields<a name="postgresql-single-extra"></a>
```bash
    # Azure PostgreSQL storage backup geo redundant is enabled
    azurerm_postgresql_server_storage_profile_backup_geo_redundant_enabled = false

    # Azure PostgreSQL server storage retention days
    azurerm_postgresql_server_storage_profile_backup_retention_days = 7

    # Azure PostgreSQL server SSL enforcement
    azurerm_postgresql_server_ssl_enforcement = "enabled"

    azurerm_postgresql_server_storage_profile_auto_grow_enabled = true
```
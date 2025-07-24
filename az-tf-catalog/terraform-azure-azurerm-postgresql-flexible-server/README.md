# kpmg PostgreSQL Flexible

PostgreSQL delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 1.1.9

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [PostgreSQL Flexible single](#postgresql-single)
- [Output](#output)

## PostgreSQL single<a name="postgresql-single"></a>
```bash
module "postgresql-flexible-server" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-postgresql-flexible-server.git"

    azurerm_postgresql_flexible_server_name                                         = "server-name"
    azurerm_postgresql_flexible_server_location                                     = "Westeurope"
    azurerm_postgresql_flexible_server_resource_group_name                          = "myrg-dev-rg-01"
    azurerm_postgresql_flexible_server_sku_name                                     = "B_Standard_B1ms"
    azurerm_postgresql_flexible_server_storage_profile_storage_mb                   = "32768"
    azurerm_postgresql_flexible_server_storage_profile_backup_retention_days        = 7
    azurerm_postgresql_flexible_server_storage_profile_backup_geo_redundant_enabled = true
    azurerm_postgresql_flexible_server_administrator_login                          = "psqladmin"
    azurerm_postgresql_flexible_server_administrator_password                       = "H@Sh1CoR3!"
    azurerm_postgresql_flexible_server_version                                      = "12"
    azurerm_postgresql_flexible_server_tags                                         = {"key":"value"}
    azurerm_postgresql_flexible_server_zone                                         = "1"
    #azurerm_postgresql_flexible_server_delegated_subnet_id                         = azurerm_subnet.example.id (Optional)
    #azurerm_postgresql_flexible_server_private_dns_zone_id                         = azurerm_private_dns_zone.example.id (Optional)
    #azurerm_postgresql_flexible_server_databases                                   = "db1,db2,db3" (Optional - default empty)
}
```
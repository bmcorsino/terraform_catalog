# kpmg MSSQL Database

MSSQL delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## MSSQL Database<a name="mssql"></a>
```bash
module "mssql-database" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-mysql-server.git"

    azurerm_database_name                         = "appname-dev-sqldb-01"
    azurerm_server_id                             = "/path-mssql-id/appname-dev-sql-01"
    azurerm_elastic_pool_id                       = "/path-mssql-id/appname-dev-sqlelasticpool-01" OR null
    azurerm_database_collation                    = "SQL_LATIN1_GENERAL_CP1_CI_AS"
    azurerm_database_max_size_gb                  = 4
    azurerm_database_min_capacity                 = 1
    azurerm_database_read_replica_count           = 0
    azurerm_database_read_scale                   = false
    azurerm_database_sku_name                     = "GP_Gen5_2"
    azurerm_database_license_type                 = "LicenseIncluded"
    azurerm_database_threat_detection_policy      = {}
    azurerm_database_zone_redundant               = true
    azurerm_database_standard_count               = 1
    azurerm_database_serveless_count              = 0
    azurerm_database_dw_count                     = 0
    azurerm_database_elastic_dtu_count            = 0
    azurerm_database_auto_pause_delay_in_minutes  = 100
    tags                                          = {key=value}
}
```

## Output<a name="mssql-output"></a>
```bash
output "main" {
    value = module.mssql-database.main
}
```
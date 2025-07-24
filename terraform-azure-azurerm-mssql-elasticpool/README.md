# ElasticPool

ElasticPool delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## MSSQL ElasticPool<a name="mssql-elasticpool"></a>
```bash
module "mssql-elasticpool" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-mssql-elasticpool.git"

    elasticpool_count                   = 1
    name                                = "appname-dev-sqlelasticpool-01"
    server_name                         = "appname-dev-sql-01"
    azurerm_resource_group_name         = "appname-dev-rg-01"
    azurerm_location                    = "Westeurope"
    max_size_gb                         = 50
    zone_redundant                      = false
    sku_name                            = "BC_Gen5"
    sku_tier                            = "BusinessCritical"
    sku_family                          = "Gen5"
    sku_capacity                        = 4
    per_database_settings_min_capacity  = 0.25
    per_database_settings_max_capacity  = 4
    tags                                = {key=value,}
}
```

## Output<a name="mssql-elasticpool-output"></a>
```bash
output "main" {
    value = module.mssql-elasticpool.main
}
```
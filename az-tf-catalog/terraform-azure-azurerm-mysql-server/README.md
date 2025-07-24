# kpmg MySQL

MySQL delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14
  - Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/mysql_server.html

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [MySQL](#mysql)
- [Output](#output)

## MySQL<a name="mysql"></a>
```bash
module "mysql-server" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-mysql-server.git"

    azurerm_db_server_location        = "Westeurope"
    azurerm_resource_group_name       = "appname-dev-rg-01"

    name                              = "<application>-<environment>-mysql[-ROLE]-<seq number>"
    administrator_login               = "mysqladminun"
    administrator_login_password      = "H@Sh1CoR3!"

    sku_name                          = "GP_Gen5_4"
    auto_grow_enabled                 = true
    storage_mb                        = 640000
    backup_retention_days             = 7
    geo_redundant_backup_enabled      = true
    infrastructure_encryption_enabled = false
    public_network_access_enabled     = false
    db_version                        = "5.7"
    ssl_enforcement_enabled           = true
    ssl_minimal_tls_version_enforced  = "TLS1_2"
    tags                              = { "key" = "value", }
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.mysql-server.main
}
```
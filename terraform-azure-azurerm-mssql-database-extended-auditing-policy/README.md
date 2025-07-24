# DXC MSSQL Database extended autiting policy

MSSQL Database extended autiting policy delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## MSSQL Database extended autiting policy<a name="mssql"></a>
```bash
module "app_mssql_database_extended_auditing_policy" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-mssql-database-extended-auditing-policy.git"

    auditing_policy_count                   = 1
    database_id                             = "/path-mssql-id/appname-dev-sqldb-01"
    storage_endpoint                        = "https://acctname.blob.core.windows.net"
    storage_account_access_key              = "access_key"
    storage_account_access_key_is_secondary = false
    retention_in_days                       = 6
}
```

## Output<a name="mssql-database-autiting-output"></a>
```bash
output "main" {
    value = module.app_mssql_database_extended_auditing_policy.main
}
```
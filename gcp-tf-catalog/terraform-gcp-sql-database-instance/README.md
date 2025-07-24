# SQL Database Instance

Creates a new Google SQL Database Instance


## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [SQL Database Instance](#sql)

## SQL Database Instance <a name="sql"></a>
```bash
module "gcp_sql_database" {
    source            = "https://github.kpmg.com/PT-CloudOps-Team/gcp-tf-catalog/tree/main/terraform-gcp-sql-database-instance"

    name                = ""
    database_version    = "POSTGRES_14"
    deletion_protection = false

    tier                = "db-f1-micro"
}
```
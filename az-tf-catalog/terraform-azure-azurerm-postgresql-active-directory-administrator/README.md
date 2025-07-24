# kpmg PostgreSQL AD Administrator

PostgreSQL AD Administrator delivery according to model and value combinations, below are the tested and validated examples.

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

- [PostgreSQL AD](#postgresql-ad)
- [Output](#output)

## PostgreSQL ad<a name="postgresql-ad"></a>
```bash
module "azurerm-postgresql-active-directory-administrator" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-postgresql-active-directory-administrator.git"

    azurerm_resource_group_name = "my-dev-rg-01"
    azuread_user                = "user@domain"
    login                       = "user@domain"
    server_name                 = "appname-dev-postgresql-role-54"
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.azurerm-postgresql-active-directory-administrator.main
}
```
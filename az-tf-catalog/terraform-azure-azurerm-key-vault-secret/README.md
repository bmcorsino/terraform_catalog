# kpmg KeyVaultSecret

KeyVaultSecret delivery according to model and value combinations, below are the tested and validated examples.

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

- [KeyVaultSecret](#KeyVaultSecret)
- [Output](#output)

## KeyVaultSecret<a name="KeyVaultSecret"></a>
```bash
module "key-vault-secret" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-key-vault-secret.git"

    name                        = "secret-name"
    content_type                = "secret-type"
    value                       = "secret-value"
    tags                        = {}
    has_lifecycle               = true/false
    azurerm_key_vault_name      = "<application>-<environment>-keyvault[-ROLE]-<seq number>"
    azurerm_resource_group_name = "appname-dev-rg-01" // my-dev-rg-01
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.key-vault-secret.main
}
output "main_lifecycle" {
  value = module.key-vault-secret.main_lifecycle
}
```
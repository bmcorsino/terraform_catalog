# kpmg AppRegistration

AppRegistration delivery according to model and value combinations, below are the tested and validated examples

  - Terraform 14

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [AppRegistration](#AppRegistration)
- [Output](#output)

## AppRegistration<a name="AppRegistration"></a>
```bash
module "terraform-azure-azurerm-app-registration" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-app-registration.git"

    name                       = "<application>-<environment>-svcprincipal[-ROLE]-01"
    reply_urls                 = []
    passwd_end_date            = "2099-01-01T01:02:03Z"
    passwd_description         = "My managed password"
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.terraform-azure-azurerm-app-registration.main
  sensitive = true
}
```
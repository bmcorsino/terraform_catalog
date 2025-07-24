# kpmg Deploy Echo Bot

DeployEchoBot delivery according to model and value combinations, below are the tested and validated examples

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

- [DeployEchoBot](#DeployEchoBot)
- [Output](#output)

## DeployEchoBot<a name="DeployEchoBot"></a>
```bash
module "terraform-azure-azurerm-app-echo-bot" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-app-echo-bot.git"

    subscription_id     = "e0c332c0-0db1-41ca-8455-27bb848a48c9"
    resource_group_name = "appname-dev-rg-01"
    webapp_name         = "appname-dev-app-01"
}
```

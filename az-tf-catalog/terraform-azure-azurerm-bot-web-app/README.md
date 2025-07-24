# kpmg BotWebApp

BotWebApp delivery according to model and value combinations, below are the tested and validated examples.

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

- [BotWebApp](#BotWebApp)
- [Output](#output)

## BotWebApp<a name="BotWebApp"></a>
```bash
module "kpmg-azure-azurerm-bot-web-app" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-bot-web-app.git"

    name                = "<application>-<environment>-chatbot[-role]-<seq number>"
    location            = "global"
    resource_group_name = "appname-dev-rg-01" // my-dev-rg-01
    sku                 = "F0"
    microsoft_app_id    = "<application-id>"
    tags                = {}
    luis_app_ids        = null
    luis_key            = null
    endpoint            = null
    app_insights_key            = null
    app_insights_api_key        = null
    app_insights_application_id = null
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.kpmg-azure-azurerm-bot-web-app.main
}
```
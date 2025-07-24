# kpmg FunctionApp

FunctionApp delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## FunctionApp<a name="FunctionApp"></a>
```bash
module "function-app-service" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-function-app-service.git?ref=v.2.0.0"
    azurerm_resource_group_name                     = "appname-dev-rg-01"
    azurerm_service_plan_id                         = "/path-service-plan-id/appname-dev-plan-01"
    azurerm_app_service_location                    = "westeurope"
    function_app_standard_count                     = 1
    function_app_consumption_count                  = 0
    name                                            = "appname-dev-func-01"
    app_runtime                                     = "PYTHON|3.8"
    app_container                                   = false
    storage_account_name                            = "appnamedevstr01"
    auth_settings_active_directory_issuer_tenant_id = ""
    auth_settings_active_directory_client_id        = ""
    auth_settings_active_directory_client_secret    = ""
    app_settings                                    = {}
    auth_settings_runtime_version                   = "~1"
    auth_settings_unauthenticated_client_action     = "RedirectToLoginPage"
    azurerm_app_service_tags                        = {key = value}
    azurerm_resource_depends_on                     = []
}
```

## Output<a name="FunctionApp-output"></a>
```bash
output "main" {
    value = module.function-app-service.main
}
```
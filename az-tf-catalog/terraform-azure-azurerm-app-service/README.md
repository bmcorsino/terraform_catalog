# kpmg WebApp

WebApp delivery according to model and value combinations, below are the tested and validated examples

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## WebApp<a name="WebApp"></a>
```bash
module "app-service" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-app-service.git?ref=v.2.0.0"

    azurerm_app_service_resource_group_name                             = "appname-dev-rg-01"
    azurerm_service_plan_id                                             = "/path-service-plan-id/appname-dev-plan-01"
    azurerm_app_service_location                                        = "westeurope"
    app_linux_count                                                     = 0
    app_windows_count                                                   = 1
    azurerm_app_service_name                                            = "appname-dev-app-01"
    app_runtime                                                         = "PHP|7.3"
    auth_settings_active_directory_issuer_tenant_id                     = ""
    auth_settings_active_directory_client_id                            = ""
    auth_settings_active_directory_client_secret                        = ""
    auth_settings_active_directory_allowed_audiences                    = []
    azurerm_app_service_site_config_websockets_enabled                  = false
    azurerm_app_service_site_config_cors_allowed_origins                = []
    azurerm_app_service_site_config_default_documents                   = []
    azurerm_app_service_site_config_scm_type                            = "LocalGit"
    azurerm_app_service_site_config_use_32_bit_worker_process           = false
    azurerm_app_service_app_settings                                    = {}
    azurerm_app_service_app_auth_settings_runtime_version               = "~1"
    azurerm_app_service_app_auth_settings_unauthenticated_client_action = "RedirectToLoginPage"
    azurerm_app_service_tags                                            = {key = value}
    backup_enabled                                                      = false
    backup_storage_account_url                                          = null
    azurerm_resource_depends_on                                         = []
}
```

## Output<a name="WebApp-output"></a>
```bash
output "main" {
    value = module.app-service.main
}
```
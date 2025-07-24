# terraform-azurerm-app-service-slot

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/app_service_slot.html>

## Create a Azure App Service Slot

This Terraform module creates a Azure App Service Slot.

## Usage example

```hcl
module "app-service-slot" {
    source = "./terraform-azure-azurerm-app-service-slot"
    azurerm_app_service_slot_name                            = "${var.app_name}-${var.environment}-app-service-slot-01"
    azurerm_app_service_slot_app_service_name                = "${module.app-service.azurerm_app_service_name}"
    azurerm_app_service_slot_location                        = "${var.location}"
    azurerm_app_service_slot_resource_group_name             = "${module.resource-group.azurerm_resource_group_name}"
    azurerm_app_service_slot_plan_id                         = "${module.app-service-plan.azurerm_app_service_plan_id}"
    azurerm_app_service_slot_site_config_linux_fx_version    = "PHP|7.3"
    azurerm_app_service_slot_site_config_scm_type            = "None"  
    azurerm_app_service_slot_tags                            = "${var.resource_tags}"
}
```

## Extra parameters

```hcl
azurerm_app_service_client_affinity_enabled = true
azurerm_app_service_client_cert_enabled = false
azurerm_app_service_site_config_always_on = false
azurerm_app_service_site_config_default_documents = []
azurerm_app_service_site_config_dotnet_framework_version = "v4.0"
azurerm_app_service_site_config_ftps_state = "AllAllowed"
azurerm_app_service_site_config_http2_enabled = false
azurerm_app_service_site_config_ip_restriction = []
azurerm_app_service_site_config_local_mysql_enabled = false
azurerm_app_service_site_config_managed_pipeline_mode = "Integrated"
azurerm_app_service_site_config_min_tls_version = "1.2"
azurerm_app_service_site_config_remote_debugging_enabled = false
azurerm_app_service_site_config_remote_debugging_version = "VS2017"
azurerm_app_service_site_config_use_32_bit_worker_process = false
azurerm_app_service_site_config_websockets_enabled = false
azurerm_app_service_site_config_cors_allowed_origins = []
azurerm_app_service_site_config_cors_support_credentials = false

azurerm_app_service_auth_settings_additional_login_params = {}
azurerm_app_service_auth_settings_allowed_external_redirect_urls = []
azurerm_app_service_auth_settings_enabled = false
azurerm_app_service_auth_settings_token_refresh_extension_hours = 0
azurerm_app_service_auth_settings_token_store_enabled = false

azurerm_app_service_app_settings = {
    "SOME_KEY" = "some-value"
    }

```

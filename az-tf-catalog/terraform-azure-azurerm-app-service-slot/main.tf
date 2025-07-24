resource "azurerm_app_service_slot" "main" {
  name                        = "${var.azurerm_app_service_slot_name}"
  app_service_name            = "${var.azurerm_app_service_slot_app_service_name}"
  location                    = "${var.azurerm_app_service_slot_location}"
  resource_group_name         = "${var.azurerm_app_service_slot_resource_group_name}"
  app_service_plan_id         = "${var.azurerm_app_service_slot_plan_id}"
  client_affinity_enabled     = "${var.azurerm_app_service_slot_client_affinity_enabled}"

  site_config {
    linux_fx_version          = "${var.azurerm_app_service_slot_site_config_linux_fx_version}"
    scm_type                  = "${var.azurerm_app_service_slot_site_config_scm_type}"  
    always_on                 = "${var.azurerm_app_service_slot_site_config_always_on}"
    default_documents         = "${var.azurerm_app_service_slot_site_config_default_documents}"
    dotnet_framework_version  = "${var.azurerm_app_service_slot_site_config_dotnet_framework_version}"
    ftps_state                = "${var.azurerm_app_service_slot_site_config_ftps_state}"
    http2_enabled             = "${var.azurerm_app_service_slot_site_config_http2_enabled}"
    ip_restriction            = "${var.azurerm_app_service_slot_site_config_ip_restriction}"
    local_mysql_enabled       = "${var.azurerm_app_service_slot_site_config_local_mysql_enabled}"
    managed_pipeline_mode     = "${var.azurerm_app_service_slot_site_config_managed_pipeline_mode}"
    min_tls_version           = "${var.azurerm_app_service_slot_site_config_min_tls_version}"
    remote_debugging_enabled  = "${var.azurerm_app_service_slot_site_config_remote_debugging_enabled}"
    remote_debugging_version  = "${var.azurerm_app_service_slot_site_config_remote_debugging_version}"
    use_32_bit_worker_process = "${var.azurerm_app_service_slot_site_config_use_32_bit_worker_process}"
    websockets_enabled        = "${var.azurerm_app_service_slot_site_config_websockets_enabled}"
    cors {
      allowed_origins         =  "${var.azurerm_app_service_slot_site_config_cors_allowed_origins}"
      support_credentials     =  "${var.azurerm_app_service_slot_site_config_cors_support_credentials}"
    }
  }

  auth_settings {
    additional_login_params        = "${var.azurerm_app_service_slot_auth_settings_additional_login_params}"
    allowed_external_redirect_urls = "${var.azurerm_app_service_slot_auth_settings_allowed_external_redirect_urls}"
    enabled                        = "${var.azurerm_app_service_slot_auth_settings_enabled}"
    token_refresh_extension_hours  = "${var.azurerm_app_service_slot_auth_settings_token_refresh_extension_hours}" 
    token_store_enabled            = "${var.azurerm_app_service_slot_auth_settings_token_store_enabled}" 
  }

  tags = "${var.azurerm_app_service_slot_tags}"

  app_settings = "${var.azurerm_app_service_slot_app_settings}"
}

resource "azurerm_app_service" "main" {
  count                         = var.app_linux_count

  name                          = var.azurerm_app_service_name
  location                      = var.azurerm_app_service_location
  resource_group_name           = var.azurerm_app_service_resource_group_name

  app_service_plan_id           = var.azurerm_service_plan_id

  client_cert_enabled           = var.azurerm_app_service_client_cert_enabled
  https_only                    = true

  site_config {
    linux_fx_version          = var.app_runtime

    app_command_line          = var.azurerm_app_service_site_config_app_command_line
    scm_type                  = var.azurerm_app_service_site_config_scm_type
    always_on                 = var.azurerm_app_service_site_config_always_on
    default_documents         = var.azurerm_app_service_site_config_default_documents
    dotnet_framework_version  = var.azurerm_app_service_site_config_dotnet_framework_version
    ftps_state                = var.azurerm_app_service_site_config_ftps_state
    http2_enabled             = var.azurerm_app_service_site_config_http2_enabled
    ip_restriction            = var.azurerm_app_service_site_config_ip_restriction
    local_mysql_enabled       = var.azurerm_app_service_site_config_local_mysql_enabled
    managed_pipeline_mode     = var.azurerm_app_service_site_config_managed_pipeline_mode
    min_tls_version           = var.azurerm_app_service_site_config_min_tls_version
    remote_debugging_enabled  = var.azurerm_app_service_site_config_remote_debugging_enabled
    remote_debugging_version  = var.azurerm_app_service_site_config_remote_debugging_version
    use_32_bit_worker_process = var.azurerm_app_service_site_config_use_32_bit_worker_process
    websockets_enabled        = var.azurerm_app_service_site_config_websockets_enabled
    cors {
      allowed_origins         = var.azurerm_app_service_site_config_cors_allowed_origins
      support_credentials     = var.azurerm_app_service_site_config_cors_support_credentials
    }
  }

  auth_settings {
    additional_login_params        = var.azurerm_app_service_auth_settings_additional_login_params
    allowed_external_redirect_urls = var.azurerm_app_service_auth_settings_allowed_external_redirect_urls
    enabled                        = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_enabled : true
    token_refresh_extension_hours  = var.auth_settings_active_directory_client_id != "" ? var.azurerm_app_service_auth_settings_token_refresh_extension_hours : 0
    token_store_enabled            = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_token_store_enabled : true
    default_provider               = var.auth_settings_active_directory_client_id != "" ? "AzureActiveDirectory": null
    issuer                         = var.auth_settings_active_directory_client_id != "" && var.auth_settings_active_directory_issuer_tenant_id != "" ? "https://sts.windows.net/${var.auth_settings_active_directory_issuer_tenant_id}/": null
    runtime_version                = var.azurerm_app_service_app_auth_settings_runtime_version
    unauthenticated_client_action  = var.azurerm_app_service_app_auth_settings_unauthenticated_client_action

    dynamic "active_directory" {
        for_each = var.auth_settings_active_directory_client_id == "" ? [] : [var.auth_settings_active_directory_client_id]

        content {
            client_id     = active_directory.value
            client_secret = var.auth_settings_active_directory_client_secret
            allowed_audiences = var.auth_settings_active_directory_allowed_audiences
        }
    }
  }

  logs {
        application_logs {
            azure_blob_storage {
                level = var.azurerm_app_service_logs_level
                sas_url = var.azurerm_app_service_logs_sas_url
                retention_in_days = var.azurerm_app_service_logs_retention_in_days
            }
        }
  }

  dynamic "backup" {
    for_each = var.backup_enabled ? [var.backup_enabled] : []

    content {
      name                = var.azurerm_app_service_name 
      enabled             = var.backup_enabled
      storage_account_url = var.backup_storage_account_url

      schedule {
        frequency_interval = var.backup_schedule_frequency_interval
        frequency_unit     = var.backup_schedule_frequency_unit
        keep_at_least_one_backup = var.backup_schedule_keep_at_least_one_backup
        retention_period_in_days = var.backup_schedule_retention_period_in_days 
      }
    }
  }

  app_settings = var.azurerm_app_service_app_settings
  tags         = var.azurerm_app_service_tags
  depends_on   = [var.azurerm_resource_depends_on]
}

resource "azurerm_app_service" "main_windows" {
  count                         = var.app_windows_count

  name                          = var.azurerm_app_service_name
  location                      = var.azurerm_app_service_location
  resource_group_name           = var.azurerm_app_service_resource_group_name

  app_service_plan_id           = var.azurerm_service_plan_id

  client_cert_enabled           = var.azurerm_app_service_client_cert_enabled
  https_only                    = true

  site_config {
    windows_fx_version        = var.app_runtime

    app_command_line          = var.azurerm_app_service_site_config_app_command_line
    scm_type                  = var.azurerm_app_service_site_config_scm_type
    always_on                 = var.azurerm_app_service_site_config_always_on
    default_documents         = var.azurerm_app_service_site_config_default_documents
    dotnet_framework_version  = var.azurerm_app_service_site_config_dotnet_framework_version
    ftps_state                = var.azurerm_app_service_site_config_ftps_state
    http2_enabled             = var.azurerm_app_service_site_config_http2_enabled
    ip_restriction            = var.azurerm_app_service_site_config_ip_restriction
    local_mysql_enabled       = var.azurerm_app_service_site_config_local_mysql_enabled
    managed_pipeline_mode     = var.azurerm_app_service_site_config_managed_pipeline_mode
    min_tls_version           = var.azurerm_app_service_site_config_min_tls_version
    remote_debugging_enabled  = var.azurerm_app_service_site_config_remote_debugging_enabled
    remote_debugging_version  = var.azurerm_app_service_site_config_remote_debugging_version
    use_32_bit_worker_process = var.azurerm_app_service_site_config_use_32_bit_worker_process
    websockets_enabled        = var.azurerm_app_service_site_config_websockets_enabled
    cors {
      allowed_origins         = var.azurerm_app_service_site_config_cors_allowed_origins
      support_credentials     = var.azurerm_app_service_site_config_cors_support_credentials
    }
  }

  auth_settings {
    additional_login_params        = var.azurerm_app_service_auth_settings_additional_login_params
    allowed_external_redirect_urls = var.azurerm_app_service_auth_settings_allowed_external_redirect_urls
    enabled                        = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_enabled : true
    token_refresh_extension_hours  = var.auth_settings_active_directory_client_id != "" ? var.azurerm_app_service_auth_settings_token_refresh_extension_hours : 0
    token_store_enabled            = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_token_store_enabled : true
    default_provider               = var.auth_settings_active_directory_client_id != "" ? "AzureActiveDirectory": null
    issuer                         = var.auth_settings_active_directory_client_id != "" && var.auth_settings_active_directory_issuer_tenant_id != "" ? "https://sts.windows.net/${var.auth_settings_active_directory_issuer_tenant_id}/": null
    runtime_version                = var.azurerm_app_service_app_auth_settings_runtime_version
    unauthenticated_client_action  = var.azurerm_app_service_app_auth_settings_unauthenticated_client_action

    dynamic "active_directory" {
        for_each = var.auth_settings_active_directory_client_id == "" ? [] : [var.auth_settings_active_directory_client_id]

        content {
            client_id     = active_directory.value
            client_secret = var.auth_settings_active_directory_client_secret
            allowed_audiences = var.auth_settings_active_directory_allowed_audiences
        }
    }
  }

  logs {
        application_logs {
            azure_blob_storage {
                level = var.azurerm_app_service_logs_level
                sas_url = var.azurerm_app_service_logs_sas_url
                retention_in_days = var.azurerm_app_service_logs_retention_in_days
            }
        }
  }

  dynamic "backup" {
    for_each = var.backup_enabled ? [var.backup_enabled] : []

    content {
      name                = var.azurerm_app_service_name 
      enabled             = var.backup_enabled
      storage_account_url = var.backup_storage_account_url

      schedule {
        frequency_interval = var.backup_schedule_frequency_interval
        frequency_unit     = var.backup_schedule_frequency_unit
        keep_at_least_one_backup = var.backup_schedule_keep_at_least_one_backup
        retention_period_in_days = var.backup_schedule_retention_period_in_days 
      }
    }
  }

  app_settings = var.azurerm_app_service_app_settings
  tags         = var.azurerm_app_service_tags
  depends_on   = [var.azurerm_resource_depends_on]
}
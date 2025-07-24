data "azurerm_storage_account" "main" {
    name                = var.storage_account_name
    resource_group_name = var.azurerm_resource_group_name
    depends_on          = [var.azurerm_resource_depends_on]
}

resource "azurerm_windows_function_app" "main" {
    count                         = var.function_app_standard_count

    name                          = var.name
    location                      = var.azurerm_app_service_location
    resource_group_name           = var.azurerm_resource_group_name

    storage_account_name          = var.storage_account_name
    storage_account_access_key    = data.azurerm_storage_account.main.primary_access_key

    https_only                    = true
    functions_extension_version   = var.azurerm_app_functions_extension_version

    site_config {
        always_on                 = var.azurerm_app_service_site_config_always_on
        ftps_state                = var.azurerm_app_service_site_config_ftps_state
        http2_enabled             = var.azurerm_app_service_site_config_http2_enabled
        ip_restriction            = var.azurerm_app_service_site_config_ip_restriction
        minimum_tls_version       = var.azurerm_app_service_site_config_min_tls_version
        use_32_bit_worker         = var.azurerm_app_service_site_config_use_32_bit_worker_process
        websockets_enabled        = var.azurerm_app_service_site_config_websockets_enabled
        cors {
            allowed_origins         =  var.azurerm_app_service_site_config_cors_allowed_origins
            support_credentials     =  var.azurerm_app_service_site_config_cors_support_credentials
        }
        application_stack {
            java_version            = var.azurerm_function_app_java_version
            dotnet_version          = var.azurerm_function_app_dotnet_version
            node_version            = var.azurerm_function_app_node_version
            powershell_core_version = var.azurerm_function_app_powershell_core_version
            use_custom_runtime      = var.azurerm_function_app_use_custom_runtime
        }
    }

    auth_settings {
        additional_login_parameters    = var.azurerm_app_service_auth_settings_additional_login_params
        allowed_external_redirect_urls = var.azurerm_app_service_auth_settings_allowed_external_redirect_urls
        enabled                        = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_enabled : true
        token_refresh_extension_hours  = var.auth_settings_active_directory_client_id != "" ? var.azurerm_app_service_auth_settings_token_refresh_extension_hours : 0
        token_store_enabled            = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_token_store_enabled : true
        default_provider               = var.auth_settings_active_directory_client_id != "" ? "AzureActiveDirectory": null
        issuer                         = var.auth_settings_active_directory_client_id != "" && var.auth_settings_active_directory_issuer_tenant_id != "" ? "https://sts.windows.net/${var.auth_settings_active_directory_issuer_tenant_id}/": null
        runtime_version                = var.auth_settings_runtime_version
        unauthenticated_client_action  = var.auth_settings_unauthenticated_client_action

        dynamic "active_directory" {
            for_each = var.auth_settings_active_directory_client_id == "" ? [] : [var.auth_settings_active_directory_client_id]

            content {
                client_id     = active_directory.value
                client_secret = var.auth_settings_active_directory_client_secret
            }
        }
    }

    service_plan_id           = var.azurerm_service_plan_id
    app_settings                  = var.app_settings
    tags                          = var.azurerm_app_service_tags
    depends_on                    = [var.azurerm_resource_depends_on]
}

resource "azurerm_windows_function_app" "main_consumption" {
    count                         = var.function_app_consumption_count

    name                          = var.name
    location                      = var.azurerm_app_service_location
    resource_group_name           = var.azurerm_resource_group_name

    storage_account_name          = var.storage_account_name
    storage_account_access_key    = data.azurerm_storage_account.main.primary_access_key

    https_only                    = true

    site_config {
        always_on                 = var.azurerm_app_service_site_config_always_on
        ftps_state                = var.azurerm_app_service_site_config_ftps_state
        http2_enabled             = var.azurerm_app_service_site_config_http2_enabled
        ip_restriction            = var.azurerm_app_service_site_config_ip_restriction
        minimum_tls_version       = var.azurerm_app_service_site_config_min_tls_version
        use_32_bit_worker         = var.azurerm_app_service_site_config_use_32_bit_worker_process
        websockets_enabled        = var.azurerm_app_service_site_config_websockets_enabled
        cors {
            allowed_origins         =  var.azurerm_app_service_site_config_cors_allowed_origins
            support_credentials     =  var.azurerm_app_service_site_config_cors_support_credentials
        }
        application_stack {
            java_version            = var.azurerm_function_app_java_version
            dotnet_version          = var.azurerm_function_app_dotnet_version
            node_version            = var.azurerm_function_app_node_version
            powershell_core_version = var.azurerm_function_app_powershell_core_version
            use_custom_runtime      = var.azurerm_function_app_use_custom_runtime
        }
    }

    auth_settings {
        additional_login_parameters    = var.azurerm_app_service_auth_settings_additional_login_params
        allowed_external_redirect_urls = var.azurerm_app_service_auth_settings_allowed_external_redirect_urls
        enabled                        = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_enabled : true
        token_refresh_extension_hours  = var.auth_settings_active_directory_client_id != "" ? var.azurerm_app_service_auth_settings_token_refresh_extension_hours : 0
        token_store_enabled            = var.auth_settings_active_directory_client_id == "" ? var.azurerm_app_service_auth_settings_token_store_enabled : true
        default_provider               = var.auth_settings_active_directory_client_id != "" ? "AzureActiveDirectory": null
        issuer                         = var.auth_settings_active_directory_client_id != "" && var.auth_settings_active_directory_issuer_tenant_id != "" ? "https://sts.windows.net/${var.auth_settings_active_directory_issuer_tenant_id}/": null
        runtime_version                = var.auth_settings_runtime_version
        unauthenticated_client_action  = var.auth_settings_unauthenticated_client_action

        dynamic "active_directory" {
            for_each = var.auth_settings_active_directory_client_id == "" ? [] : [var.auth_settings_active_directory_client_id]

            content {
                client_id     = active_directory.value
                client_secret = var.auth_settings_active_directory_client_secret
            }
        }
    }

    service_plan_id               = var.azurerm_service_plan_id
    app_settings                  = var.app_settings
    tags                          = var.azurerm_app_service_tags
    depends_on                    = [var.azurerm_resource_depends_on]
}
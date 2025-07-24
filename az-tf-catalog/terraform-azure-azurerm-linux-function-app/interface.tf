variable "azurerm_app_service_location" {
  description = "Azure App Service location"
}
variable "azurerm_resource_group_name" {
  description = "Azure App Service resource group"
}
variable "name" {}
variable "storage_account_name" {}
variable "azurerm_service_plan_id" {}
variable "app_container" {
  default = false
}
variable "azurerm_app_functions_extension_version" {
  default = "~4"
}
variable "auth_settings_active_directory_client_id" {
  default = ""
}
variable "auth_settings_active_directory_issuer_tenant_id" {
  default = ""
}
variable "auth_settings_active_directory_client_secret" {
  default = ""
}
variable "app_settings" {
  default = {}
}
variable "auth_settings_runtime_version" {
  default = "~1"
}
variable "auth_settings_unauthenticated_client_action" {
  default = "RedirectToLoginPage"
}
variable "function_app_standard_count" {
  default = 1
}
variable "function_app_consumption_count" {
  default = 0
}
variable "azurerm_app_service_site_config_always_on" {
    description = "Azure App Service Site Config always on"
    default = false
}
variable "azurerm_app_service_site_config_ftps_state" {
    description = "Azure App Service Site Config ftps state"
    default = "AllAllowed"
}
variable "azurerm_app_service_site_config_http2_enabled" {
    description = "Azure App Service Site Config http2 enabled"
    default = false 
}
variable "azurerm_app_service_site_config_ip_restriction" {
    description = "Azure App Service Site Config IP restriction"
    default = []
}
variable "azurerm_app_service_site_config_min_tls_version" {
    description = "Azure App Service Site Config min TLS version"
    default = "1.2"
}
variable "azurerm_app_service_site_config_use_32_bit_worker_process" {
    description = "Azure App Service Site Config use 32 bit worker process"
    default = false
}
variable "azurerm_app_service_site_config_websockets_enabled" {
    description = "Azure App Service Site Config websockets enabled"
    default = false
}
variable "azurerm_app_service_site_config_cors_allowed_origins" {
    description = "Azure App Service Site Config cors allowed origins"
    default = []
}
variable "azurerm_app_service_site_config_cors_support_credentials" {
    description = "Azure App Service Site Config cors support credentials"
    default = false
}  
variable "azurerm_app_service_auth_settings_additional_login_params" {
    description = "Azure App Service auth settings additional login params"
    default = {}
}  
variable "azurerm_app_service_auth_settings_allowed_external_redirect_urls" {
    description = "Azure App Service auth settings allowed external redirect urls "
    default = []
} 
variable "azurerm_app_service_auth_settings_enabled" {
    description = "Azure App Service auth settings enabled"
    default = false
}   
# The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72
variable "azurerm_app_service_auth_settings_token_refresh_extension_hours" {
    description = "Azure App Service auth settings token refresh extension hours"
    default = 72
}
variable "azurerm_app_service_auth_settings_token_store_enabled" {
    description = "Azure App Service auth settings token store enabled"
    default = false
}   
variable "azurerm_app_service_tags" {
    description = "Azure App Service Tags"
    default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "azurerm_function_app_dotnet_version" {
  default = null
}
variable "azurerm_function_app_java_version" {
    default = null
}
variable "azurerm_function_app_node_version" {
    default = null
}
variable "azurerm_function_app_python_version" {
    default = "3.8"
}
variable "azurerm_function_app_powershell_core_version" {
    default = null
}
variable "azurerm_function_app_use_custom_runtime" {
    default = null
}
variable "azurerm_app_service_name" {
    description = "Azure App Service name"
}
variable "azurerm_app_service_location" {
    description = "Azure App Service location"
}
variable "azurerm_app_service_resource_group_name" {
    description = "Azure App Service resource group"
}
variable "azurerm_service_plan_id" {}
variable "azurerm_app_service_site_config_app_command_line" {
  default = ""
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
variable "auth_settings_active_directory_allowed_audiences" {
  default = []
}
variable "app_linux_count" {
  default = 1
}
variable "azurerm_app_service_app_auth_settings_runtime_version" {
  default = "~1"
}
variable "azurerm_app_service_app_auth_settings_unauthenticated_client_action" {
  default = "RedirectToLoginPage"
}
variable "azurerm_app_service_client_cert_enabled" {
    description = "Azure App Service client cert enabled"
    default = false
}
variable "azurerm_app_service_site_config_always_on" {
    description = "Azure App Service Site Config always on"
    default = false
}
variable "azurerm_app_service_site_config_default_documents" {
    description = "Azure App Service Site Config default documents"
    default = []
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
variable "azurerm_app_service_site_config_local_mysql_enabled" {
    description = "Azure App Service Site Config local mySQL enabled"
    default = false
}
variable "azurerm_app_service_site_config_managed_pipeline_mode" {
    description = "Azure App Service Site Config managed pipeline mode"
    default = "Integrated"
}
variable "azurerm_app_service_site_config_min_tls_version" {
    description = "Azure App Service Site Config min TLS version"
    default = "1.2"
}
variable "azurerm_app_service_site_config_remote_debugging_enabled" {
    description = "Azure App Service Site Config remote debugging enabled"
    default = false
}
variable "azurerm_app_service_site_config_remote_debugging_version" {
    description = "Azure App Service Site Config remote debugging version"
    default = "VS2017"
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
    default = 0
}   
variable "azurerm_app_service_auth_settings_token_store_enabled" {
    description = "Azure App Service auth settings token store enabled"
    default = false
}   
variable "azurerm_app_service_tags" {
    description = "Azure App Service Tags"
    default = {}
}
variable "azurerm_app_service_logs_level" {
    description = "Azure App Service Logs level"
    default = "Error"
}
variable "azurerm_app_service_logs_sas_url" {
    description = "Azure App Service Logs sas url"
    default = ""
}
variable "azurerm_app_service_logs_retention_in_days" {
    description = "Azure App Service Log retention in days"
    default = 0
}
variable "azurerm_app_file_system_level" {
    default = "Error"
}
variable "azurerm_app_service_app_settings" {
    description = "Azure App Service App settings"
    default = {}
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "backup_enabled" {
    default = false
}
variable "backup_storage_account_url" {
    default = null
}
variable "backup_schedule_frequency_interval" {
    default = 1
}
variable "backup_schedule_frequency_unit" {
    default = "Day"
}
variable "backup_schedule_retention_period_days" {
    default = 21
}
variable "backup_schedule_keep_at_least_one_backup" {
    default = true
}
variable "azurerm_app_dotnet_version" {
    default = null
}
variable "azurerm_app_node_version" {
    default = null
}
variable "azurerm_app_java_version" {
    default = null
}
variable "azurerm_app_java_server" {
    default = null
}
variable "azurerm_app_java_server_version" {
    default = null
}
variable "azurerm_app_python_version" {
    default = null
}
variable "azurerm_app_php_version" {
    default = null  
}
variable "azurerm_app_docker_image" {
    default = null
}
variable "azurerm_app_docker_image_tag" {
    default = null
}
variable "azurerm_app_ruby_version" {
    default = null 
}
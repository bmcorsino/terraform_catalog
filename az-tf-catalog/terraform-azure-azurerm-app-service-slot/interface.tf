variable "azurerm_app_service_slot_name" {
    description = ""
}
variable "azurerm_app_service_slot_app_service_name" {
    description = ""
}
variable "azurerm_app_service_slot_location" {
    description = ""
}
variable "azurerm_app_service_slot_resource_group_name" {
    description = ""
}
variable "azurerm_app_service_slot_plan_id" {
    description = ""
}
variable "azurerm_app_service_slot_client_affinity_enabled" {
    description = ""
    default = false
}
variable "azurerm_app_service_slot_site_config_linux_fx_version" {
    description = ""
}
variable "azurerm_app_service_slot_site_config_scm_type" {
    description = ""
}
variable "azurerm_app_service_slot_site_config_always_on" {
    description = ""
    default = false
}
variable "azurerm_app_service_slot_site_config_default_documents" {
    description = ""
    default = []
}
variable "azurerm_app_service_slot_site_config_dotnet_framework_version" {
    description = ""
    default = "v4.0"
}
variable "azurerm_app_service_slot_site_config_ftps_state" {
    description = ""
    default = "AllAllowed"
}
variable "azurerm_app_service_slot_site_config_http2_enabled" {
    description = ""
    default = false 
}
variable "azurerm_app_service_slot_site_config_ip_restriction" {
    description = ""
    default = []
}
variable "azurerm_app_service_slot_site_config_local_mysql_enabled" {
    description = ""
    default = false
}
variable "azurerm_app_service_slot_site_config_managed_pipeline_mode" {
    description = ""
    default = "Integrated"
}
variable "azurerm_app_service_slot_site_config_min_tls_version" {
    description = ""
    default = "1.2"
}
variable "azurerm_app_service_slot_site_config_remote_debugging_enabled" {
    description = ""
    default = false
}
variable "azurerm_app_service_slot_site_config_remote_debugging_version" {
    description = ""
    default = "VS2017"
}
variable "azurerm_app_service_slot_site_config_use_32_bit_worker_process" {
    description = ""
    default = false
}
variable "azurerm_app_service_slot_site_config_websockets_enabled" {
    description = ""
    default = false
}
variable "azurerm_app_service_slot_site_config_cors_allowed_origins" {
    description = ""
    default = []
}
variable "azurerm_app_service_slot_site_config_cors_support_credentials" {
    description = ""
    default = false
}   
variable "azurerm_app_service_slot_auth_settings_additional_login_params" {
    description = ""
    default = {}
}   
variable "azurerm_app_service_slot_auth_settings_allowed_external_redirect_urls" {
    description = ""
    default = []
}   
variable "azurerm_app_service_slot_auth_settings_enabled" {
    description = ""
    default = false
}   
variable "azurerm_app_service_slot_auth_settings_token_refresh_extension_hours" {
    description = ""
    default = 0
}   
variable "azurerm_app_service_slot_auth_settings_token_store_enabled" {
    description = ""
    default = false
}   
variable "azurerm_app_service_slot_tags" {
    description = ""
}
variable "azurerm_app_service_slot_app_settings" {
    description = ""
    default = {}
}

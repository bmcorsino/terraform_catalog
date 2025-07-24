variable "azurerm_policy_assignment_name" {
  type 	= string
}
variable "azurerm_policy_assignment_scope" {
  type 	= string
}
variable "azurerm_policy_assignment_location" {
  type 	= string
  default = "westeurope"
}
variable "azurerm_policy_assignment_display_name" {
  type 	= string
  default = "Azure SQL Server Initiative assignment"
}
variable "azurerm_policy_assignment_description" {
  type 	= string
  default = "Initiative assignment of Server Level Azure SQL policies."
}
variable "azurerm_policy_assignment_parameter_sqlAuditingSettingsPolicyEffect" {
  type 	= string
  default = "DeployIfNotExists"
}
variable "azurerm_policy_assignment_parameter_sqlAuditingSettingsState" {
  type 	= string
  default = "Enabled"
}
variable "azurerm_policy_assignment_parameter_sqlAuditStorageAccountRetentionDays" {
  type 	= string
  default = "1825"
}
variable "azurerm_policy_assignment_parameter_sqlAuditStorageAccountId" {
  type 	= string
}
variable "azurerm_policy_assignment_parameter_sqlAuditLogToEventHubEnabled" {
  type 	= string
  default = "True"
}
variable "azurerm_policy_assignment_parameter_sqlAuditEventHubRetentionDays" {
  type 	= string
  default = "90"
}
variable "azurerm_policy_assignment_parameter_sqlAuditEventHubName" {
  type 	= string
  default = "ehsqlaudit"
}
variable "azurerm_policy_assignment_parameter_sqlAuditEventHubAuthorizationRuleId" {
  type 	= string
}
variable "azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionPolicyEffect" {
  type 	= string
  default = "DeployIfNotExists"
}
variable "azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionState" {
  type 	= string
  default = "Enabled"
}
variable "azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionStorageAccountId" {
  type 	= string
}
variable "azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionStorageAccountRetentionDays" {
  type 	= string
  default = "1825"
}
variable "azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionEmailAccountAdmins" {
  type 	= string
  default = "False"
}
variable "azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionEmailAddresses" {
  type 	= string
}


output "azurerm_policy_assignment_assign_sql_policies_main_output" {
  value = azurerm_policy_assignment.assign_sql_policies_main
}

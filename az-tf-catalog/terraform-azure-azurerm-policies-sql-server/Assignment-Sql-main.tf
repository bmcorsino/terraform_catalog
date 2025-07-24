resource "azurerm_policy_assignment" "assign_sql_policies_main" {
  name                   = var.azurerm_policy_assignment_name
  scope                  = var.azurerm_policy_assignment_scope
  policy_definition_id   = azurerm_policy_set_definition.initiative_sql.id
  identity {
    type                 = "SystemAssigned"
  }
  location               = var.azurerm_policy_assignment_location
  display_name           = var.azurerm_policy_assignment_display_name
  description            = var.azurerm_policy_assignment_description

  parameters = <<-PARAMETERS
    {
      "sqlAuditingSettingsPolicyEffect": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditingSettingsPolicyEffect}"
      },
      "sqlAuditingSettingsState": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditingSettingsState}"
      },
      "sqlAuditStorageAccountRetentionDays": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditStorageAccountRetentionDays}"
      },
      "sqlAuditStorageAccountId": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditStorageAccountId}"
      },
      "sqlAuditLogToEventHubEnabled": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditLogToEventHubEnabled}"
      },
      "sqlAuditEventHubRetentionDays": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditEventHubRetentionDays}"
      },
      "sqlAuditEventHubName": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditEventHubName}"
      },
      "sqlAuditEventHubAuthorizationRuleId": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlAuditEventHubAuthorizationRuleId}"
      },
      "sqlSecurityThreatDetectionPolicyEffect": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionPolicyEffect}"
      },
      "sqlSecurityThreatDetectionState": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionState}"
      },
      "sqlSecurityThreatDetectionStorageAccountId": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionStorageAccountId}"
      },
      "sqlSecurityThreatDetectionStorageAccountRetentionDays": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionStorageAccountRetentionDays}"
      },
      "sqlSecurityThreatDetectionEmailAccountAdmins": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionEmailAccountAdmins}"
      },
      "sqlSecurityThreatDetectionEmailAddresses": {
        "value": "${var.azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionEmailAddresses}"
      }
    }
  PARAMETERS
}

/*
name - (Required) The name of the Policy Assignment. Changing this forces a new resource to be created.
scope- (Required) The Scope at which the Policy Assignment should be applied, which must be a Resource ID (such as Subscription e.g. /subscriptions/00000000-0000-0000-000000000000 or a Resource Group e.g./subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup). Changing this forces a new resource to be created.
policy_definition_id - (Required) The ID of the Policy Definition to be applied at the specified Scope.
identity - (Optional) An identity block.
  type - (Required) The Managed Service Identity Type of this Policy Assignment. Possible values are SystemAssigned (where Azure will generate a Service Principal for you), or None (no use of a Managed Service Identity).
    NOTE: When type is set to SystemAssigned, identity the Principal ID can be retrieved after the policy has been assigned.
location - (Optional) The Azure location where this policy assignment should exist. This is required when an Identity is assigned. Changing this forces a new resource to be created.
description - (Optional) A description to use for this Policy Assignment. Changing this forces a new resource to be created.
display_name - (Optional) A friendly display name to use for this Policy Assignment. Changing this forces a new resource to be created.
parameters - (Optional) Parameters for the policy definition. This field is a JSON object that maps to the Parameters field from the Policy Definition. Changing this forces a new resource to be created.
  NOTE: This value is required when the specified Policy Definition contains the parameters field.
not_scopes - (Optional) A list of the Policy Assignment's excluded scopes. The list must contain Resource IDs (such as Subscriptions e.g. /subscriptions/00000000-0000-0000-000000000000 or Resource Groups e.g./subscriptions/00000000-0000-0000-000000000000/resourceGroups/myResourceGroup).
*/

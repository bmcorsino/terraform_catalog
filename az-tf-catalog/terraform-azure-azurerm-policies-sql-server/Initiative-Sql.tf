resource "azurerm_policy_set_definition" "initiative_sql" {
  name         = "initiative-sql"
  policy_type  = "Custom"
  display_name = "Sql Server - Azure SQL Server Initiative"
  description  = "Initiative with Server Level Azure SQL policies."

  metadata = <<-METADATA
    {
    "category": "SQL"
    }
  METADATA

  parameters = <<-PARAMETERS
    {
      "sqlAuditingSettingsPolicyEffect": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Audit Log - Policy Effect",
          "description": "Auditing Settings policy desired effect/action."
        },
        "allowedValues": [
          "AuditIfNotExists",
          "Deny",
          "DeployIfNotExists",
          "Disabled"
        ],
        "defaultValue": "AuditIfNotExists"
      },
      "sqlAuditingSettingsState": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Audit Log - Enabled/Disabled",
          "description": "Desired Auditing Settings state."
        },
        "allowedValues": [
          "Enabled",
          "Disabled"
        ],
        "defaultValue": "Enabled"
      },
      "sqlAuditStorageAccountRetentionDays": {
        "type": "String",
        "defaultValue": "180",
        "metadata": {
            "displayName": "SQL Audit Log to Storage Account - Retention days (>=1825)",
            "description": "The value in days (>=1825) of the log retention period in Storage Account (0 indicates unlimited retention)."
        }
      },
      "sqlAuditStorageAccountId": {
        "type": "String",
        "metadata": {
            "displayName": "SQL Audit Log to Storage Account - Storage Account Id",
            "description": "SQL Auditing writes SQL events to an audit log in your Azure Storage account."
        }
      },
      "sqlAuditLogToEventHubEnabled": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Audit Log to Event Hub - Enable",
          "description": "SQL Audit Settings log to Event Hub enabled."
        },
        "allowedValues": [
          "True",
          "False"
        ],
        "defaultValue": "True"
      },
      "sqlAuditEventHubRetentionDays": {
        "type": "String",
        "defaultValue": "180",
        "metadata": {
            "displayName": "SQL Audit Log to Event Hub - Retention days",
            "description": "The value in days of the SQL Audit retention period in Event Hub."
        }
      },
      "sqlAuditEventHubName": {
        "type": "String",
        "defaultValue": "",
        "metadata": {
          "displayName": "SQL Audit Log to Event Hub - Event Hub Name",
          "description": "SQL Audit Event Hub Name in the Event Hub Namespace."
        }
      },
      "sqlAuditEventHubAuthorizationRuleId": {
        "type": "String",
        "defaultValue": "",
        "metadata": {
          "displayName": "SQL Audit Log to Event Hub - Authorization Rule ID",
          "description": "SQL Audit Event Hub Authorization Rule ID in the Event Hub Namespace."
        }
      },
      "sqlSecurityThreatDetectionPolicyEffect": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Security Threat Detection - Policy Effect",
          "description": "Desired SQL Security Threat Detection policy desired effect/action."
        },
        "allowedValues": [
          "AuditIfNotExists",
          "Deny",
          "DeployIfNotExists",
          "Disabled"
        ],
        "defaultValue": "DeployIfNotExists"
      },
      "sqlSecurityThreatDetectionState": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Security Threat Detection - State Enabled/Disabled",
          "description": "Desired Security Threat Detection state."
        },
        "allowedValues": [
          "Enabled",
          "Disabled"
        ],
        "defaultValue": "Enabled"
      },
      "sqlSecurityThreatDetectionStorageAccountId": {
        "type": "String",
        "metadata": {
            "displayName": "SQL Security Threat Detection - Storage Account Id",
            "description": "SQL Security Threat Detection writes threat events to an audit log in your Azure Storage account."
        }
      },
      "sqlSecurityThreatDetectionStorageAccountRetentionDays": {
        "type": "String",
        "defaultValue": "1825",
        "metadata": {
            "displayName": "SQL Security Threat Detection - Retention days (>=1825) in Storage Account",
            "description": "The value in days (>=1825) of the log retention period in Storage Account (0 indicates unlimited retention)."
        }
      },
      "sqlSecurityThreatDetectionEmailAccountAdmins": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Security Threat Detection - Notify Account Admins by email.",
          "description": "Enable notifying Account Admins by email True/False."
        },
        "allowedValues": [
          "True",
          "False"
        ],
        "defaultValue": "True"
      },
      "sqlSecurityThreatDetectionEmailAddresses": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Security Threat Detection - Comma separated list of email addresses to notify.",
          "description": "Comma separated list of email addresses to notify of Security Threat Detections."
        }
      }
    }
  PARAMETERS

  policy_definitions = <<-POLICY_DEFINITIONS
    [
        {
            "parameters": {
                "sqlAuditingSettingsPolicyEffect": {
                    "value": "[parameters('sqlAuditingSettingsPolicyEffect')]"
                },
                "sqlAuditingSettingsState": {
                    "value": "[parameters('sqlAuditingSettingsState')]"
                },
                "sqlAuditStorageAccountRetentionDays": {
                    "value": "[parameters('sqlAuditStorageAccountRetentionDays')]"
                },
                "sqlAuditStorageAccountId": {
                    "value": "[parameters('sqlAuditStorageAccountId')]"
                }
            },
            "policyDefinitionId": "${azurerm_policy_definition.Sql_Auditing_Storage_Account_Deploy.id}"
        },
        {
            "parameters": {
                "sqlAuditingSettingsPolicyEffect": {
                    "value": "[parameters('sqlAuditingSettingsPolicyEffect')]"
                },
                "sqlAuditingSettingsState": {
                    "value": "[parameters('sqlAuditingSettingsState')]"
                },
                "sqlAuditLogToEventHubEnabled": {
                    "value": "[parameters('sqlAuditLogToEventHubEnabled')]"
                },
                "sqlAuditEventHubRetentionDays": {
                    "value": "[parameters('sqlAuditEventHubRetentionDays')]"
                },
                "sqlAuditEventHubName": {
                    "value": "[parameters('sqlAuditEventHubName')]"
                },
                "sqlAuditEventHubAuthorizationRuleId": {
                    "value": "[parameters('sqlAuditEventHubAuthorizationRuleId')]"
                }
            },
            "policyDefinitionId": "${azurerm_policy_definition.Sql_Auditing_Event_Hub_Deploy.id}"
        },
        {
            "parameters": {
                "sqlSecurityThreatDetectionPolicyEffect": {
                    "value": "[parameters('sqlSecurityThreatDetectionPolicyEffect')]"
                },
                "sqlSecurityThreatDetectionState": {
                    "value": "[parameters('sqlSecurityThreatDetectionState')]"
                },
                "sqlSecurityThreatDetectionStorageAccountId": {
                    "value": "[parameters('sqlSecurityThreatDetectionStorageAccountId')]"
                },
                "sqlSecurityThreatDetectionStorageAccountRetentionDays": {
                    "value": "[parameters('sqlSecurityThreatDetectionStorageAccountRetentionDays')]"
                },
                "sqlSecurityThreatDetectionEmailAccountAdmins": {
                    "value": "[parameters('sqlSecurityThreatDetectionEmailAccountAdmins')]"
                },
                "sqlSecurityThreatDetectionEmailAddresses": {
                    "value": "[parameters('sqlSecurityThreatDetectionEmailAddresses')]"
                }
            },
            "policyDefinitionId": "${azurerm_policy_definition.Sql_Security_Threat_Detection_Deploy.id}"
        }
    ]
  POLICY_DEFINITIONS
}
output "azurerm_policy_set_definition_initiative_sql_output" {
  value = azurerm_policy_set_definition.initiative_sql
}

/*
name - (Required) The name of the policy set definition. Changing this forces a new resource to be created.
policy_type - (Required) The policy set type. Possible values are BuiltIn or Custom. Changing this forces a new resource to be created.
display_name - (Required) The display name of the policy set definition.
policy_definitions - (Required) The policy definitions for the policy set definition. This is a json object representing the bundled policy definitions .
description - (Optional) The description of the policy set definition.
management_group_id - (Optional) The ID of the Management Group where this policy should be defined. Changing this forces a new resource to be created.
  Note: if you are using azurerm_management_group to assign a value to management_group_id, be sure to use .group_id and not .id.
metadata - (Optional) The metadata for the policy set definition. This is a json object representing additional metadata that should be stored with the policy definition.
parameters - (Optional) Parameters for the policy set definition. This field is a json object that allows you to parameterize your policy definition.
*/

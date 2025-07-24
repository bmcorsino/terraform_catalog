resource "azurerm_policy_definition" "Sql_Auditing_Event_Hub_Deploy" {
  name         = "SqlAuditingEventHubDeploy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Sql Server Auditing on Event Hub with Deploy"
  description  = "Sql Server level auditing Enabled with Logs on Event Hub."

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
          "displayName": "SQL Audit Log policy Effect",
          "description": "Desired SQL Auditing Settings policy desired effect/action."
        },
        "allowedValues": [
          "AuditIfNotExists",
          "Deny",
          "DeployIfNotExists",
          "Disabled"
        ],
        "defaultValue": "DeployIfNotExists"
      },
      "sqlAuditingSettingsState": {
        "type": "String",
        "metadata": {
          "displayName": "Enabled/Disabled SQL Audit Log",
          "description": "Desired SQL Auditing Settings state."
        },
        "allowedValues": [
          "Enabled",
          "Disabled"
        ],
        "defaultValue": "Enabled"
      },
      "sqlAuditLogToEventHubEnabled": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Audit log to Event Hub enabled.",
          "description": "SQL Audit Settings log to Event Hub enabled True/False."
        },
        "allowedValues": [
          "True",
          "False"
        ],
        "defaultValue": "False"
      },
      "sqlAuditEventHubRetentionDays": {
        "type": "String",
        "defaultValue": "90",
        "metadata": {
            "displayName": "SQL Audit retention days in Event Hub",
            "description": "The value in days of the SQL Audit retention period in Event Hub."
        }
      },
      "sqlAuditEventHubName": {
        "type": "String",
        "defaultValue": "",
        "metadata": {
          "displayName": "SQL Audit log Event Hub name",
          "description": "SQL Audit Event Hub Name in the Event Hub Namespace."
        }
      },
      "sqlAuditEventHubAuthorizationRuleId": {
        "type": "String",
        "defaultValue": "",
        "metadata": {
          "displayName": "SQL Audit log Event Hub Authorization Rule ID",
          "description": "SQL Audit Event Hub Authorization Rule ID in the Event Hub Namespace."
        }
      }
    }
  PARAMETERS

  policy_rule = <<-POLICY_RULE
    {
      "if": {
        "field": "type",
        "equals": "Microsoft.Sql/servers"
      },
      "then": {
        "effect": "[parameters('sqlAuditingSettingsPolicyEffect')]",
        "details": {
          "type": "Microsoft.Sql/servers/auditingSettings",
          "name": "default",
          "existenceCondition": {
            "allOf": [
              {
                  "field": "Microsoft.Sql/servers/auditingSettings/state",
                  "equals": "[parameters('sqlAuditingSettingsState')]"
              },
              {
                  "field": "Microsoft.Sql/servers/auditingSettings/isAzureMonitorTargetEnabled",
                  "equals": "[parameters('sqlAuditLogToEventHubEnabled')]"
              }
            ]
          },
          "roleDefinitionIds": [            
            "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c",
            "/providers/microsoft.authorization/roleDefinitions/056cd41c-7e88-42e1-933e-88ba6a50c9c3",
            "/providers/microsoft.authorization/roleDefinitions/17d1049b-9a84-46fb-8f53-869881c3d3ab"
          ],
          "deployment": {

            "properties": {
              "mode": "incremental",
              "parameters": {
                "serverName": {
                    "value": "[field('name')]"
                },
                "sqlAuditingSettingsState": {
                    "value": "[parameters('sqlAuditingSettingsState')]"
                },
                "sqlAuditLogToEventHubEnabled": {
                    "value": "[bool(parameters('sqlAuditLogToEventHubEnabled'))]"
                },
                "sqlAuditEventHubRetentionDays": {
                    "value": "[int(parameters('sqlAuditEventHubRetentionDays'))]"
                },
                "sqlAuditEventHubName": {
                    "value": "[parameters('sqlAuditEventHubName')]"
                },
                "sqlAuditEventHubAuthorizationRuleId": {
                    "value": "[parameters('sqlAuditEventHubAuthorizationRuleId')]"
                }
              },

              "template": {
                "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                "contentVersion": "1.0.0.0",
                "parameters": {
                    "serverName": {
                      "type": "string"
                    },
                    "sqlAuditingSettingsState": {
                      "type": "string"
                    },
                    "sqlAuditLogToEventHubEnabled": {
                      "type": "bool"
                    },
                    "sqlAuditEventHubRetentionDays": {
                      "type": "int"
                    },
                    "sqlAuditEventHubName": {
                      "type": "string"
                    },
                    "sqlAuditEventHubAuthorizationRuleId": {
                      "type": "string"
                    }
                },
                "variables": {
                },
                "resources": [
                  {
                      "condition": "[and(parameters('sqlAuditLogToEventHubEnabled'),equals(parameters('sqlAuditingSettingsState'),'Enabled'))]",
                      "name": "[concat(parameters('serverName'),'/master/microsoft.insights/SQLSecurityAuditEvents-',parameters('serverName'))]",
                      "type": "Microsoft.Sql/servers/databases/providers/diagnosticSettings",
                      "dependsOn": [],
                      "apiVersion": "2017-05-01-preview",
                      "properties": {
                          "name": "[concat('SQLSecurityAuditEvents-',parameters('serverName'))]",
                          "eventHubAuthorizationRuleId": "[parameters('sqlAuditEventHubAuthorizationRuleId')]",
                          "eventHubName": "[parameters('sqlAuditEventHubName')]",
                          "logs": [
                              {
                                  "category": "SQLSecurityAuditEvents",
                                  "enabled": true,
                                  "retentionPolicy": {
                                      "days": "[parameters('sqlAuditEventHubRetentionDays')]",
                                      "enabled": true
                                  }
                              }
                          ]
                      }
                  },
                  {
                    "condition": "[equals(parameters('sqlAuditingSettingsState'),'Enabled')]",
                    "name": "[concat(parameters('serverName'), '/Default')]",
                    "type": "Microsoft.Sql/servers/auditingSettings",
                    "apiVersion": "2017-03-01-preview",
                    "properties": {
                      "state": "[parameters('sqlAuditingSettingsState')]",
                      "isAzureMonitorTargetEnabled": "[parameters('sqlAuditLogToEventHubEnabled')]"
                    }
                  }
                ]
              }
            }
          }
        }
      }
    }
  POLICY_RULE
}
output "azurerm_policy_definition_Sql_Auditing_Event_Hub_Deploy_output" {
  value = azurerm_policy_definition.Sql_Auditing_Event_Hub_Deploy
}

/*

              {
                  "field": "Microsoft.Insights/diagnosticSettings/logs[*].retentionPolicy.days",
                  "greaterOrEquals": 90
              },


name - (Required) The name of the policy definition. Changing this forces a new resource to be created.
policy_type - (Required) The policy type. The value can be "BuiltIn", "Custom" or "NotSpecified". Changing this forces a new resource to be created.
mode - (Required) The policy mode that allows you to specify which resource types will be evaluated. The value can be "All", "Indexed" or "NotSpecified". Changing this resource forces a new resource to be created.
display_name - (Required) The display name of the policy definition.
description - (Optional) The description of the policy definition.
management_group_id - (Optional) The ID of the Management Group where this policy should be defined. Changing this forces a new resource to be created.
  Note: if you are using azurerm_management_group to assign a value to management_group_id, be sure to use .group_id and not .id.
policy_rule - (Optional) The policy rule for the policy definition. This is a json object representing the rule that contains an if and a then block.
metadata - (Optional) The metadata for the policy definition. This is a json object representing additional metadata that should be stored with the policy definition.
parameters - (Optional) Parameters for the policy definition. This field is a json object that allows you to parameterize your policy definition.
*/

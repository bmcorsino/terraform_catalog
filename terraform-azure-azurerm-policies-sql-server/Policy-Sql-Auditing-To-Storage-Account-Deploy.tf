resource "azurerm_policy_definition" "Sql_Auditing_Storage_Account_Deploy" {
  name         = "SqlAuditingStorageAccountDeploy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Sql Server Auditing on Storage Account with Deploy"
  description  = "Sql Server level auditing Enabled with Logs on Storage Account."

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
      "sqlAuditStorageAccountMinimumRetentionDays": {
        "type": "String",
        "defaultValue": "1825",
        "metadata": {
            "displayName": "Minimum Retention days in SQL Audit Storage Account - Default 1825",
            "description": "The minimum value in days of the log retention period in Storage Account."
        }
      },
      "sqlAuditStorageAccountRetentionDays": {
        "type": "String",
        "defaultValue": "1825",
        "metadata": {
            "displayName": "Retention days (>=1825) in SQL Audit Storage Account",
            "description": "The value in days (>=1825) of the log retention period in Storage Account (0 indicates unlimited retention)."
        }
      },
      "sqlAuditStorageAccountId": {
        "type": "String",
        "metadata": {
            "displayName": "SQL Audit Log Storage Account Id",
            "description": "SQL Auditing writes database events to an audit log in your Azure Storage account."
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
                  "field": "Microsoft.Sql/servers/auditingSettings/retentionDays",
                  "greaterOrEquals": "[int(parameters('sqlAuditStorageAccountMinimumRetentionDays'))]"
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
                "sqlAuditStorageAccountRetentionDays": {
                    "value": "[int(parameters('sqlAuditStorageAccountRetentionDays'))]"
                }, 
                "sqlAuditStorageAccountId": {
                    "value": "[parameters('sqlAuditStorageAccountId')]"
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
                    "sqlAuditStorageAccountRetentionDays": {
                      "type": "int"
                    },
                    "sqlAuditStorageAccountId": {
                      "type": "string"
                    }
                },
                "variables": {
                  "auditSettingsNameEnabled": "[if(equals(parameters('sqlAuditingSettingsState'),'Enabled'), '/Default', '/Dummy')]",
                  "auditSettingsNameDisabled": "[if(equals(parameters('sqlAuditingSettingsState'),'Enabled'), '/Dummy', '/Default')]"
                },
                "resources": [
                  {
                    "condition": "[equals(parameters('sqlAuditingSettingsState'),'Enabled')]",
                    "name": "[concat(parameters('serverName'), variables('auditSettingsNameEnabled'))]",
                    "type": "Microsoft.Sql/servers/auditingSettings",
                    "apiVersion": "2017-03-01-preview",
                    "properties": {
                      "state": "[parameters('sqlAuditingSettingsState')]",
                      "storageEndpoint": "[reference(parameters('sqlAuditStorageAccountId'), '2018-03-01-preview').PrimaryEndpoints.Blob]",
                      "storageAccountAccessKey": "[listKeys(parameters('sqlAuditStorageAccountId'), '2018-03-01-preview').keys[0].value]",
                      "retentionDays": "[parameters('sqlAuditStorageAccountRetentionDays')]",
                      "storageAccountSubscriptionId": "[subscription().subscriptionId]",
                      "isStorageSecondaryKeyInUse": false,
                      "auditActionsAndGroups": null
                    }
                  },
                  {
                    "condition": "[equals(parameters('sqlAuditingSettingsState'),'Disabled')]",
                    "name": "[concat(parameters('serverName'), variables('auditSettingsNameDisabled'))]",
                    "type": "Microsoft.Sql/servers/auditingSettings",
                    "apiVersion": "2017-03-01-preview",
                    "properties": {
                      "state": "[parameters('sqlAuditingSettingsState')]",
                      "storageEndpoint": null,
                      "storageAccountAccessKey": null,
                      "retentionDays": null,
                      "storageAccountSubscriptionId": null,
                      "isStorageSecondaryKeyInUse": null,
                      "auditActionsAndGroups": null
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
output "azurerm_policy_definition_Sql_Auditing_Storage_Account_Deploy_output" {
  value = azurerm_policy_definition.Sql_Auditing_Storage_Account_Deploy
}

/*
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

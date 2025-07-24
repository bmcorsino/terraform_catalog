resource "azurerm_policy_definition" "Sql_Security_Threat_Detection_Deploy" {
  name         = "SqlSecurityThreatDetectionDeploy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Sql Server Threat Detection State Enable/Disable with Deploy"
  description  = "Server level Threat Detection policy ensures that Threat Detection is enabled on SQL Servers."

  metadata = <<-METADATA
    {
    "category": "SQL"
    }
  METADATA

  parameters = <<-PARAMETERS
    {
      "sqlSecurityThreatDetectionPolicyEffect": {
        "type": "String",
        "metadata": {
          "displayName": "SQL Security Threat Detection policy Effect",
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
          "displayName": "Enabled/Disabled Security Threat Detection",
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
            "displayName": "SQL Security Threat Detection Storage Account Id",
            "description": "SQL Security Threat Detection writes threat events to an audit log in your Azure Storage account."
        }
      },
      "sqlSecurityThreatDetectionStorageAccountRetentionDays": {
        "type": "String",
        "defaultValue": "180",
        "metadata": {
            "displayName": "Retention days in SQL Security Threat Detection Storage Account",
            "description": "The value in days of the log retention period in Storage Account (0 indicates unlimited retention)."
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
          "displayName": "SQL Security Threat Detection comma separated list of email addresses to notify.",
          "description": "Comma separated list of email addresses to notify of Security Threat Detections."
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
        "effect": "[parameters('sqlSecurityThreatDetectionPolicyEffect')]",
        "details": {
          "type": "Microsoft.Sql/servers/securityAlertPolicies",
          "name": "default",
          "existenceCondition": {
            "allOf": [
              {
                "field": "Microsoft.Sql/servers/securityAlertPolicies/state",
                "equals": "[parameters('sqlSecurityThreatDetectionState')]"
              },
              {
                "field": "Microsoft.Sql/servers/securityAlertPolicies/disabledAlerts[*]",
                "equals": ""
              },
              {
                "field": "Microsoft.Sql/servers/securityAlertPolicies/retentionDays",
                "greaterOrEquals": 90
              }
            ]
          },
          "roleDefinitionIds": [            
            "/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c",
            "/providers/microsoft.authorization/roleDefinitions/056cd41c-7e88-42e1-933e-88ba6a50c9c3"
          ],
          "deployment": {

            "properties": {
              "mode": "incremental",
              "parameters": {
                "serverName": {
                    "value": "[field('name')]"
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
                    "value": "[bool(parameters('sqlSecurityThreatDetectionEmailAccountAdmins'))]"
                },
                "sqlSecurityThreatDetectionEmailAddresses": {
                    "value": "[split(replace(parameters('sqlSecurityThreatDetectionEmailAddresses'),' ',''),',')]"
                } 
              },

              "template": {
                "$schema": "http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
                "contentVersion": "1.0.0.0",
                "parameters": {
                    "serverName": {
                      "type": "string"
                    },
                    "sqlSecurityThreatDetectionState": {
                      "type": "string"
                    },
                    "sqlSecurityThreatDetectionStorageAccountId": {
                      "type": "string"
                    },
                    "sqlSecurityThreatDetectionStorageAccountRetentionDays": {
                      "type": "string"
                    },
                    "sqlSecurityThreatDetectionEmailAccountAdmins": {
                      "type": "bool"
                    },
                    "sqlSecurityThreatDetectionEmailAddresses": {
                      "type": "array"
                    }
                },
                "variables": {},
                "resources": [
                  {
                    "name": "[concat(parameters('serverName'), '/Default')]",
                    "type": "Microsoft.Sql/servers/securityAlertPolicies",
                    "apiVersion": "2017-03-01-preview",
                    "properties": {
                      "state": "[parameters('sqlSecurityThreatDetectionState')]",
                      "storageEndpoint": "[reference(parameters('sqlSecurityThreatDetectionStorageAccountId'), '2018-03-01-preview').PrimaryEndpoints.Blob]",
                      "storageAccountAccessKey": "[listKeys(parameters('sqlSecurityThreatDetectionStorageAccountId'), '2018-03-01-preview').keys[0].value]",
                      "retentionDays": "[parameters('sqlSecurityThreatDetectionStorageAccountRetentionDays')]",
                      "emailAccountAdmins": "[parameters('sqlSecurityThreatDetectionEmailAccountAdmins')]",
                      "emailAddresses": "[parameters('sqlSecurityThreatDetectionEmailAddresses')]",
                      "disabledAlerts": [
                        ""
                      ]
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
output "azurerm_policy_definition_Sql_Security_Threat_Detection_Deploy_output" {
    value = azurerm_policy_definition.Sql_Security_Threat_Detection_Deploy
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

# terraform-azurerm-sql-server

Official terraform documentation: 
    <https://www.terraform.io/docs/providers/azurerm/r/sql_server.html>

## Create SQL Server Azure Policies, Imitiative and Assignment

This Terraform module performs an Aassignment of an Initiative with SQL Server Policies

## Usage example

```hcl
module "dxc_sql_server_policies" {
    source                                                                                      = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-policies-sql-server.git"
    azurerm_policy_assignment_name                                                              = "policy_assignment_sql_server"
    azurerm_policy_assignment_scope                                                             = "/subscriptions/ccec4790-ad26-4560-84b2-a062a98ba541/resourceGroups/appnm-dev-rg-01"
    azurerm_policy_assignment_location                                                          = "westeurope"
    azurerm_policy_assignment_display_name                                                      = "Azure SQL Server Initiative assignment"
    azurerm_policy_assignment_description                                                       = "Initiative assignment of Server Level Azure SQL policies."
    azurerm_policy_assignment_parameter_sqlAuditingSettingsPolicyEffect                         = "DeployIfNotExists"
    azurerm_policy_assignment_parameter_sqlAuditingSettingsState                                = "Enabled"
    azurerm_policy_assignment_parameter_sqlAuditStorageAccountRetentionDays                     = "1825"
    azurerm_policy_assignment_parameter_sqlAuditStorageAccountId                                = "/subscriptions/ccec4790-ad26-4560-84b2-a062a98ba541/resourceGroups/appnm-dev-rg-01/providers/Microsoft.EventHub/namespaces/EhubSqlAudit/eventhubs/ehsqlaudit"
    azurerm_policy_assignment_parameter_sqlAuditLogToEventHubEnabled                            = "True"
    azurerm_policy_assignment_parameter_sqlAuditEventHubRetentionDays                           = "90"
    azurerm_policy_assignment_parameter_sqlAuditEventHubName                                    = "ehsqlaudit"
    azurerm_policy_assignment_parameter_sqlAuditEventHubAuthorizationRuleId                     = "/subscriptions/ccec4790-ad26-4560-84b2-a062a98ba541/resourceGroups/appnm-dev-rg-01/providers/Microsoft.EventHub/namespaces/EhubSqlAudit/eventhubs/ehsqlaudit/authorizationRules/SqlServerAuditLogs"
    azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionPolicyEffect                  = "DeployIfNotExists"
    azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionState                         = "Enabled"
    azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionStorageAccountId              = "/subscriptions/ccec4790-ad26-4560-84b2-a062a98ba541/resourceGroups/appnm-dev-rg-01/providers/Microsoft.Storage/storageAccounts/allsqlaudit"
    azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionStorageAccountRetentionDays   = "1825"
    azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionEmailAccountAdmins            = "False"
    azurerm_policy_assignment_parameter_sqlSecurityThreatDetectionEmailAddresses                = "joaopedro.soares@dxc.com"
}
```

## 

```hcl

```

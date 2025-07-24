# terraform-azurerm-monitor-action-group


## Creates a monitor action group
.
## Usage

```hcl
module "azurerm_budget_action_group" {
    #Module source
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-monitor-action-group.git?sourceBranch=refs/heads/feature/add-azure-mag-module"


    #Module variables
    azurerm_monitor_action_group_name                          = "iacsmpl-test-mag-01"
    azurerm_monitor_action_group_resource_group_name           = "iacsmpl-test-rg-01" 
    azurerm_monitor_action_group_short_name                    = "iacsmpl"
    azurerm_monitor_action_group_email_receiver1               = "ex0000"
    azurerm_monitor_action_group_email_receiver1_address       = "ex0000@xxxx.com"

}

```
ss

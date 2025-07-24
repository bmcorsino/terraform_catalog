# terraform-azure-azurerm-template-deployment-budget

## Create budgets for resource groups in Azure

This Terraform module deploys one or more budgets for Resource Groups in Azure.
It uses the outputs of the Resource Group module to get the data.
This module uses an Azure ARM Template, at this moment Terraform does not support Budgets.

## Simple Usage

Creates a budget for a Resource Group

```hcl
module "template_deployment_budget" {
    source = "../terraform-azure-azurerm-template-deployment-budget"
    azurerm_template_deployment_budget_resource_group_map        = module.resource_group.resource_group_output
    azurerm_template_deployment_budget_resource_group_tags_map   = module.resource_group.resource_group_tags_output
    azurerm_template_deployment_budget_array = [
        {
            template_deployment_budget_name_suffix  = "budget-01"
            resource_group_name                     = "appnm-dev-rg-01"

            parameters_amount                       = "500"
            parameters_budgetCategory               = "Cost"
            parameters_timeGrain                    = "Monthly"
            parameters_startDate                    = "${formatdate("YYYY-MM", timestamp())}-01"
            parameters_operator                     = "GreaterThanOrEqualTo"
            parameters_threshold                    = "75"
            parameters_contactEmails                = "abc@kpmg.com, ghi@kpmg.com"
        },
    ]
}
```

## Advanced Usage

Creates three Budgets for two Resource Groups.

```hcl
module "template_deployment_budget" {
    source = "../terraform-azure-azurerm-template-deployment-budget"
    azurerm_template_deployment_budget_resource_group_map        = module.resource_group.resource_group_output
    azurerm_template_deployment_budget_resource_group_tags_map   = module.resource_group.resource_group_tags_output
    azurerm_template_deployment_budget_array = [
        {
            template_deployment_budget_name_suffix  = "budget-01"
            resource_group_name                     = "appnm-dev-rg-01"

            parameters_amount                       = "500"
            parameters_budgetCategory               = "Cost"
            parameters_timeGrain                    = "Monthly"
            parameters_startDate                    = "${formatdate("YYYY-MM", timestamp())}-01"
            parameters_operator                     = "GreaterThanOrEqualTo"
            parameters_threshold                    = "75"
            parameters_contactEmails                = "abc@kpmg.com, ghi@kpmg.com"
        },
        {
            template_deployment_budget_name_suffix  = "budget-02"
            resource_group_name                     = "appnm-dev-rg-01"

            parameters_amount                       = "500"
            parameters_budgetCategory               = "Cost"
            parameters_timeGrain                    = "Monthly"
            parameters_startDate                    = "${formatdate("YYYY-MM", timestamp())}-01"
            parameters_operator                     = "GreaterThanOrEqualTo"
            parameters_threshold                    = "90"
            parameters_contactEmails                = "jkl@kpmg.com, ghi@kpmg.com"
        },
        {
            template_deployment_budget_name_suffix  = "budget-01"
            resource_group_name                     = "appnm-dev-rg-02"

            parameters_amount                       = "500"
            parameters_budgetCategory               = "Cost"
            parameters_timeGrain                    = "Monthly"
            parameters_startDate                    = "${formatdate("YYYY-MM", timestamp())}-01"
            parameters_operator                     = "GreaterThanOrEqualTo"
            parameters_threshold                    = "90"
            parameters_contactEmails                = "abc@kpmg.com, ghi@kpmg.com"
        },
    ]
}

```

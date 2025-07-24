# terraform-azure-azurerm-automation-schedule-job-schedule

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/automation_runbook.html>

## Create a Azure Automation Job Schedule

This Terraform module creates a Azure Automation Job Schedule.

## Usage example

```hcl
module "automation-schedule-job-schedule" {
    source = "./automation-schedule-job-schedule"

    azurerm_resource_group_name                 = "${var.azurerm_resource_group_name}"
    azurerm_automation_account_name             = "${module.automation-account.automation_account_id}"
    azurerm_automation_account_runbook_name     = "${module.automation-account-runbook-start-stop.automation_runbook_name}"

    azurerm_automation_schedule_job_array       = "${var.schedule_job}" // array map
}
```
# terraform-azure-azurerm-runbook-start-stop

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/automation_runbook.html>

## Create a Azure Automation Runbook

This Terraform module creates a Azure Automation Runbook.

## Usage example

```hcl
module "runbook-start-stop" {
    source = "./runbook-start-stop"
    azurerm_runbook_location                = "${var.azure_region}"
    azurerm_resource_group_name             = "${var.azurerm_resource_group_name}"
    azurerm_automation_account_name         = "${module.automation-account.automation_account_id}"
    azurerm_azurerm_runbook_tags            = "${local.tags}"
}
```
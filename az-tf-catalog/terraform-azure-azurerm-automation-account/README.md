# terraform-azure-azurerm-automation-account

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/automation_account.html>

## Create a Azure Automation Account

This Terraform module creates a Azure Automation Account.

## Usage example

```hcl
module "automation-account" {
    source = "./automation-account"
    azurerm_automation_account_name         = "${var.app_name}${var.environment}-automate-account01"
    azurerm_automation_account_location     = "${var.azure_region}"
    azurerm_resource_group_name             = "${var.azurerm_resource_group_name}"
    azurerm_automation_account_sku          = "${var.azurerm_automation_account_sku}"
    azurerm_automation_account_tags         = "${local.tags}"
}
```
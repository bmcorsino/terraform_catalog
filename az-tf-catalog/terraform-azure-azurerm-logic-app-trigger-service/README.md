# terraform-azurerm-logic-app-trigger-recurrence

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/logic_app_trigger_recurrence.html>

## Create a Azure Logic App Service - Trigger Recurrence

This Terraform module creates a Azure Logic App Trigger Recurrence Service.

## Usage example

```hcl
module "logic-app-workflow-trigger-recurrence-service"" {
    source                               = "./terraform-azure-azurerm-logic-app-workflow-service"
    azurerm_app_trigger_name             = "${var.app_name}${var.environment}logic-app-trigger01"
    azurerm_app_logic_app_id             = "${module.logic-app-workflow-service.id}"
    azurerm_app_trigger_frequency        = "${var.type_trigger_recurrence.frequency}"
    azurerm_app_trigger_interval         = "${var.type_trigger_recurrence.interval}"
}
```
# terraform-azurerm-logic-app-trigger-custom

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/logic_app_trigger_custom.html>

## Create a Azure Logic App Service - Trigger Custom

This Terraform module creates a Azure Logic App Trigger Custom Service.

## Usage example

```hcl
module "logic-app-workflow-trigger-custom" {
    source                               = "./terraform-azure-azurerm-logic-app-trigger-custom-service"
    azurerm_app_logic_app_id             = "${module.logic-app-workflow-service.id}"
    azurerm_app_trigger_body             = "${var.type_trigger_custom.body}"
}
```
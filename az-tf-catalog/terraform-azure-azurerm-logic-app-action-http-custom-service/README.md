# terraform-azurerm-logic-app-action-custom

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/logic_app_action_custom.html>

## Create a Azure Logic App Action Custom Service

This Terraform module creates a Azure Logic App Action Custom Service.

## Usage example

```hcl
module "logic-app-workflow-action-http-custom" {
    source                               = "./terraform-azure-azurerm-logic-app-action-http-custom-service"
    azurerm_app_logic_app_id             = "${module.logic-app-workflow-service.id}"
    azurerm_app_action_name              = "${var.app_name}${var.environment}logic-app-action-http-custom01"
    azurerm_app_logic_app_id             = "${module.logic-app-workflow-service.id}"
    azurerm_app_action_body              = "${var.type_action_http_custom.body}"
}
```
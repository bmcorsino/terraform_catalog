# terraform-azurerm-logic-app-trigger-http

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/logic_app_trigger_http_request.html>

## Create a Azure Logic App Service - Trigger Http

This Terraform module creates a Azure Logic App Trigger Http Service.

## Usage example

```hcl
module "logic-app-workflow-trigger-http-service"" {
    source                               = "./terraform-azure-azurerm-logic-app-trigger-http-service"
    azurerm_app_logic_app_id             = "${module.logic-app-workflow-service.id}"
    azurerm_app_trigger_method           = "${var.type_trigger_http_request.method}"
    azurerm_app_trigger_relative_path    = "${var.type_trigger_http_request.relative_path}"
    azurerm_app_trigger_schema           = "${var.type_trigger_http_request.schema}"
}
```
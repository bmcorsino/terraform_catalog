# terraform-azurerm-logic-app-action

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/logic_app_action_http.html>

## Create a Azure Logic App Action Service

This Terraform module creates a Azure Logic App Action Service.

## Usage example

```hcl
module "logic-app-workflow-action-http" {
    source                               = "./terraform-azure-azurerm-logic-app-action-http-service"
    azurerm_app_logic_app_id             = "${module.logic-app-workflow-service.id}"
    azurerm_app_action_method            = "${var.type_action_http.method}"
    azurerm_app_action_uri               = "${var.type_action_http.uri}"
    azurerm_app_action_body              = "${var.type_action_http.body}"
    azurerm_app_action_headers           = "${var.type_action_http.headers}"
}
```
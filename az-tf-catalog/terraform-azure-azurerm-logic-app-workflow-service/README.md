# kpmg LogicApp Workflow

LogicApp workflow delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12 and 13

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Logic App](#logic-app)
- [Extra fields](#extra-fields)
- [Output](#output)

## Logic App<a name="logic-app"></a>
```bash
module "logic-app-workflow-service" {
    azurerm_app_service_name             = "${var.app_name}-${var.environment}-lapp"
    azurerm_app_service_location         = "Westeurope"
    azurerm_resource_group_name          = "my-dev-rg-01"

    azurerm_app_service_workflow_schema  = "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json"
    azurerm_app_service_workflow_version = "1.0.0.0"
    azurerm_app_service_app_parameters   = {}

    azurerm_logicapp_start_suffix        = 1
    azurerm_numbers_logic_app            = 1
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.logic-app-workflow-service.main
}
```
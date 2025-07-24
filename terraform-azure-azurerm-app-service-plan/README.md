# terraform-azurerm-app-service-plan

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/app_service_plan.html>

## Create a Azure App Service Plan

This Terraform module creates a Azure App Service Plan.

## Usage example

```hcl
module "app-service-plan" {
    source = "./terraform-azure-azurerm-app-service-plan"
    azurerm_app_service_plan_name                    = "${var.app_name}-${var.environment}-app-service-plan-01"
    azurerm_app_service_plan_location                = "${var.location}"
    azurerm_app_service_plan_resource_group_name     = "${module.resource-group.azurerm_resource_group_name}"
    azurerm_app_service_plan_kind                    = "Linux"
    azurerm_app_service_plan_reserved                = true
    azurerm_app_service_plan_sku_tier                = "Standard"
    azurerm_app_service_plan_sku_size                = "S1"
    azurerm_app_service_plan_tags                    = "${var.resource_tags}"
}
```

## Extra parameters

```hcl
    # Azure App Service Plan Maximum elastic worker count
    azurerm_app_service_plan_maximum_elastic_worker_count = 1 #default

    # Azure App Service Plan SKU Capacity
    azurerm_app_service_plan_sku_capacity = 1 #default
```

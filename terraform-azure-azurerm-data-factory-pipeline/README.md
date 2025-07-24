# terraform-azurerm-data-factory-pipeline

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/data_factory_pipeline.html>

## Create a SQL Server Database

This Terraform module creates a Azure Data Factory Pipeline

## Usage example

```hcl
module "data-factory" {
  source = "./terraform-azure-azurerm-data-factory-pipeline"
  azurerm_data_factory_pipeline_name                = "${var.azurerm_data_factory_pipeline_name}"
  azurerm_data_factory_pipeline_resource_group_name = "${var.azurerm_data_factory_pipeline_resource_group_name}"
  azurerm_data_factory_name            				= "${var.azurerm_data_factory_name}"
}
```

## Extra parameters

```hcl

```

# terraform-azurerm-data-factory

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/data_factory.html>

## Create a SQL Server Database

This Terraform module creates a Azure Data Factory

## Usage example

```hcl
module "data-factory" {
  source = "./terraform-azure-azurerm-data-factory"
  azurerm_data_factory_name                = "${var.azurerm_data_factory_name}"
  azurerm_data_factory_resource_group_name = "${var.azurerm_data_factory_resource_group_name}"
  azurerm_data_factory_location            = "${var.azurerm_data_factory_location}"
}
```

## Extra parameters

```hcl

```

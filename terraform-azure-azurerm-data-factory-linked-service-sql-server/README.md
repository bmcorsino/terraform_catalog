# terraform-azurerm-data-factory-linked-service-sql-server

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/data_factory_linked_service_sql_server.html>

## Create a Data Factory Linked Service for SQL Server

Please refer to SQL Database <https://bitbucket.agile.corp.dxc.pt/projects/ICA/repos/terraform-azure-azurerm-sql-database/browse> and Data Factory <https://bitbucket.agile.corp.dxc.pt/projects/ICA/repos/terraform-azure-azurerm-data-factory/browse>
This Terraform module creates a Azure Data Factory Dataset SQL Server table

## Usage example

```hcl
module "data-factory-linked-service-sql-server" {
  source = "./terraform-azure-azurerm-data-factory-linked-service-sql-server"
  azurerm_data_factory_linked_service_sql_server_name                = "${var.azurerm_data_factory_linked_service_sql_server_name}"
  azurerm_data_factory_linked_service_sql_server_resource_group_name = "${var.azurerm_data_factory_linked_service_sql_server_resource_group_name}"
  azurerm_data_factory_name            				= "${var.azurerm_data_factory_name}"
  azurerm_connection_string							= "${var.azurerm_connection_string}"
  
  resource "azurerm_data_factory_linked_service_sql_server" "example" {
  data-factory-linked-service-sql-server-name                = "example"
  resource_group_name = "${azurerm_resource_group.test.name}"
  data_factory_name   = "${azurerm_data_factory.test.name}"
  connection_string   = "Integrated Security=False;Data Source=test;Initial Catalog=test;User ID=test;Password=test"
}
}
```

## Extra parameters

```hcl

```

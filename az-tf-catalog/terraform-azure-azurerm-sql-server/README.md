# terraform-azurerm-sql-server

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/sql_server.html>

## Create a SQL Server

This Terraform module a Azure SQL Server.

## Usage example

```hcl
module "sql-server" {
    source = "./terraform-azure-azurerm-sql-server"
    azurerm_resource_group_name                         = "${var.azurerm_resource_group_name}"
    azurerm_db_server_location                          = "${var.azure_region}"
    azurerm_db_server_name                              = "${var.app_name}-${var.environment}-sql-<sequence>"

    azurerm_single_database_list                        = [
        {
            db_server_data = {
                azurerm_db_server_suffix                        = ""                        // default value "" (empty)
                azurerm_db_server_exists                        = false // or true
                azurerm_db_server_name                          = "informar-caso-o-mesmo-ja-exista"
                azurerm_db_server_administrator_login           = "4dm1n157r470r"
                azurerm_db_server_administrator_login_password  = "4-v3ry-53cr37-p455w0rd"
            }
        }
    ]
}
```
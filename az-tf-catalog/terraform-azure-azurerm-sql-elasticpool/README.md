# terraform-azure-azurerm-sql-elasticpool

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/sql_elasticpool.html>

## Create a SQL Server Database

This Terraform module creates a database on a Azure SQL Server ElasticPool

## Usage example

```hcl
module "sql-elasticpool" {
    source = "./terraform-azure-azurerm-sql-elasticpool"
    azurerm_resource_group_name         = "${var.azurerm_resource_group_name}"
    azurerm_db_server_location          = "${var.azure_region}"
    azurerm_db_server_name              = "${var.app_name}-${var.environment}-sql"
    azurerm_sql_elasticpool_name        = "${var.app_name}-${var.environment}-elasticpool" // only new
    azurerm_app_db_server_list          = {
        app_db_server_name = app_db_server_name
    }

    # ATTENTION - USE ONLY THE NECESSARY BLOCK
    azurerm_single_database_list = [
        # COMPLETE EXAMPLE WITH ALL AVAILABLE FIELDS
        {
            # EXCLUSIVE DATA TO DBSERVER
            db_server_data = {
                azurerm_db_server_name_if_exists             = ""           // default value "" (empty)
                azurerm_db_server_suffix                     = ""           // default value "" (empty)
            }

            # EXCLUSIVE DATA TO ELASTIC POOL
            # IN CASE OF NEW YOU DO NOT CHOOSE THE ELASTIC_POOL NAME, IT WILL BE DEFINED BY THE kpmg/kpmg STANDARD (e.g <application>-<environment>-sqlelasticpool-<seq number>)
            # IF EMPTY name, a new ELASTIC_POOL will be created and we will use the EDITION, DTU, DTU_MAX, DTU_SIZE fields,
            # IF NOT we will only use the ELASTIC_POOL_NAME field and the rest will be ignored.
            db_server_elastic_pool_data = {
                azurerm_elastic_pool_name_if_exists         = ""            // default value "" (empty)
                azurerm_elastic_pool_suffix                 = ""            // default value "01"
                azurerm_elastic_pool_edition                = "Basic"       // Basic, Standard, and Premium (default value "Basic")
                azurerm_elastic_pool_dtu                    = 50            // default value 50
                azurerm_elastic_pool_dtu_max                = 5             // default value 0
                azurerm_elastic_pool_dtu_size               = 5000          // default value 5000
            }
        }
}
```
# terraform-azurerm-sql-database

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/sql_database.html>

## Create a SQL Server Database

This Terraform module creates a database on a Azure SQL Server

## Usage example

```hcl
module "sql-database" {
    source = "./terraform-azure-azurerm-sql-database"
    azurerm_db_server_name_new                          = "${var.app_name}-${var.environment}-sql"
    azurerm_sql_elasticpool_name                        = "${var.app_name}-${var.environment}-sqlelasticpool" // only new
    azurerm_database_name                               = "${var.app_name}-sqldb"
    azurerm_resource_group_name                         = "${var.azurerm_resource_group_name}"
    azurerm_db_server_location                          = "${var.azure_region}"
    azurerm_app_db_server_list                          = {
        app_db_server_name = app_db_server_name
    }
    azurerm_sql_elasticpool_list                        = {
        elasticpool_name = elasticpool_name
    }

    azurerm_single_database_list                        = [
        {
            # EXCLUSIVE DATA TO DBSERVER
            # IN CASE OF NEW YOU DO NOT CHOOSE THE DBSERVER NAME, IT WILL BE DEFINED BY THE kpmg/kpmg STANDARD (e.g <application>-<environment>-sql-<seq number>)
            # IF EMPTY name, a new DBSERVER will be created and we will use the LOGIN and PASSWORD fields,
            # IF NOT we will only use the SERVER_NAME field and the rest will be ignored.
            db_server_data = {
                azurerm_db_server_name                          = ""                        // default value "" (empty)
                azurerm_db_server_administrator_login           = "4dm1n157r470r"           // default value "4dm1n157r470r"
                azurerm_db_server_administrator_login_password  = "4-v3ry-53cr37-p455w0rd"  // default value "4-v3ry-53cr37-p455w0rd"
            }

            # EXCLUSIVE DATA TO ELASTIC POOL
            # IN CASE OF NEW YOU DO NOT CHOOSE THE ELASTIC_POOL NAME, IT WILL BE DEFINED BY THE kpmg/kpmg STANDARD (e.g <application>-<environment>-sqlelasticpool-<seq number>)
            # IF EMPTY name, a new ELASTIC_POOL will be created and we will use the EDITION, DTU, DTU_MAX, DTU_SIZE fields,
            # IF NOT we will only use the ELASTIC_POOL_NAME field and the rest will be ignored.
            db_server_elastic_pool_data = {
                azurerm_elastic_pool_name       = ""            // default value "" (empty)
                azurerm_elastic_pool_edition    = "Standard"    // Basic, Standard, and Premium (default value "Basic")
                azurerm_elastic_pool_dtu        = 220           // default value 200
                azurerm_elastic_pool_dtu_max    = 54            // default value 20
                azurerm_elastic_pool_dtu_size   = 2048          // default value 2048
            }

            # EXCLUSIVE DATA TO DATABASE
            # YOU DO NOT CHOOSE THE DATABASE NAME, IT WILL BE DEFINED BY THE kpmg/kpmg STANDARD (e.g <application>-<environment>-sqldb-<seq number>)
            # IF EMPTY name, a new ELASTIC_POOL will be created and we will use the EDITION, DTU, DTU_MAX, DTU_SIZE fields,
            database_data = {
                azurerm_database_collation      = "SQL_LATIN1_GENERAL_CP1_CI_AS" // default value SQL_LATIN1_GENERAL_CP1_CI_AS
            }
        }
    ]
}
```
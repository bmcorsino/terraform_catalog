# terraform-azurerm_cosmosdb_sql_database

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/cosmosdb_sql_database.html>

## Create a Azure CosmosDB Database

This Terraform module creates a Azure CosmosDB Database.

## Usage example

```hcl
module "dxc-cosmosdb-database-paas" {
    source = "./dxc-cosmosdb-database-paas"

    azure_region                                                = "Westeurope"
    azurerm_resource_group_name                                 = "my-dev-rg-01"
    app_name                                                    = "5lettersappname"
    environment                                                 = "dev"

    azurerm_cosmosdb_list = [
        {
            account_data = {
                account_name_if_exist   = "" // informar somente se existir
            }
        }
    ]
}
```
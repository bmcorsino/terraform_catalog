# terraform-azurerm-cosmosdb-container

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/cosmosdb_sql_container.html>

## Create a Azure CosmosDB Container

This Terraform module creates a Azure CosmosDB Container.

## Usage example

```hcl
module "kpmg-cosmosdb-container-paas" {
    source = "./kpmg-cosmosdb-container-paas"

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
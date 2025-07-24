# terraform-azure-azurerm-cosmosdb-account

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/cosmosdb_account.html>

## Create a Azure CosmosDB Account

This Terraform module creates a Azure CosmosDB Account.

## Usage example

```hcl
module "dxc-cosmosdb-paas" {
    source = "./dxc-cosmosdb-paas"

    azurerm_resource_group_name                      = "my-dev-rg-01"
    azurerm_cosmosdb_account_location                = "Westeurope"
    azurerm_cosmosdb_account_name                    = "appname-dev-cosmos"
    azurerm_cosmosdb_list_array = [
        {
          azurerm_cosmosdb_account_suffix            = ""
          azurerm_cosmosdb_account_offer             = "Standard"
          azurerm_cosmosdb_account_kind              = "GlobalDocumentDB"
          azurerm_cosmosdb_account_capabilities      = "" // Possible values are DisableRateLimitingResponses, EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, MongoDBv3.4 and mongoEnableDocLevelTTL.
          azurerm_cosmosdb_subnet_list               = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RGNAME>/providers/Microsoft.Network/virtualNetworks/<VNET_NAME>/subnets/<SNET_NAME>,/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RGNAME>/providers/Microsoft.Network/virtualNetworks/<VNET_NAME>/subnets/<SNET_NAME>" // default empty
          azurerm_cosmosdb_account_failover_location = "Westeurope"
        }
    ]
}
```
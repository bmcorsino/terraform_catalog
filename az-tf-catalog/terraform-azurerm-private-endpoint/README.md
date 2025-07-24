# terraform-azurerm-private-endpoint


## Create a basic private endpoint in Azure

This Terraform module deploys a private endpoint in Azure

## Usage

```hcl
module "azurerm-private-endpoint" {
  source                                        = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azurerm-private-endpoint.git"

  azurerm_resource_group_name                   = var.azurerm_resource_group_name
  azurerm_resource_location                     = var.azure_region
  azurerm_private_endpoint_name_prefix          = "appname-dev" // de acordo com parametro de datalake o nome poderá ser alterado
  azurerm_private_service_connection_name       = "StorageAccountConnect" // Podemos mudar de acordo com o recurso que injetamos
  azurerm_private_endpoint_resource_list        = [
      {
        private_endpoint_suffix                 = ""
        private_endpoint_role                   = ""
        private_endpoint_role_env               = ""
        private_endpoint_subresource_name       = "file" // blob, table, queue, file, web, dfs
        private_endpoint_subnet_id              = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/net-<ENV>-rg-01/providers/Microsoft.Network/virtualNetworks/net-<ENV>-vnet-01/subnets/net-<ENV>-subnet-data-<IP>"
      },
      {
        private_endpoint_suffix                 = ""
        private_endpoint_role                   = ""
        private_endpoint_role_env               = ""
        private_endpoint_subresource_name       = "sqlServer" // para banco mudamos o contexto
        private_endpoint_subnet_id              = "/subscriptions/<SUBSCRIPTION-ID>/resourceGroups/net-<ENV>-rg-01/providers/Microsoft.Network/virtualNetworks/net-<ENV>-vnet-01/subnets/net-<ENV>-subnet-data-<IP>"
      }
  ]
}
```

```hcl
OPTIONAL
(...)

(...)
```
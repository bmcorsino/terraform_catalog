# terraform-azurerm-postgresql-server-vnet-rule

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/postgresql_server.htmlhttps://www.terraform.io/docs/providers/azurerm/r/postgresql_virtual_network_rule.html

We recommend to never call this module with sensitive information explicit on the main file. Instead, it's a better approach to pass it as a variable like:

```
terraform plan
```

## Create a PostgreSQL database virtual network rule

This Terraform module deploys a PostgreSQL Virtual Network Rule in Azure

## Usage example

```hcl
module "postgres-server-vnet-rule" {
    source = "../terraform-azure-azurerm-postgresql-server-vnet-rule"
    azurerm_postgresql_server_vnet_rule_name = "devops-shr-rg-01-vnet-rule-01"
    azurerm_postgresql_server_vnet_rule_resource_group_name = "devops-shr-rg-01"
    azurerm_postgresql_server_vnet_rule_server_name = "postgresql-instance-01"
    azurerm_postgresql_server_vnet_rule_subnet_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/myresourcegroup/providers/Microsoft.DBforPostgreSQL/servers/myserver/virtualNetworkRules/vnetrulename"
}
```

## Extra parameters

```hcl
    # Should the Virtual Network Rule be created before the Subnet has the Virtual Network Service Endpoint enabled? 
    azurerm_postgresql_server_vnet_rule_ignore_missing_vnet_service_endpoint = false
```
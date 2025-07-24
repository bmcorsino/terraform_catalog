# terraform-azurerm-subnet

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/subnet.html

## Create a basic subnet in Azure existing network

This Terraform module deploys a subnet in Azure.

The module does not create nor expose a security group. This would need to be defined separately as additional security rules on subnets in the deployed network

## Usage

```hcl
module "subnetwork" {
    source                              = "../terraform-azure-azurerm_subnet"
    azurerm_subnet_names                = ["subnet1", "subnet2"]
    azurerm_subnet_resource_group_name  = "devops-shr-rg-01"
    azurerm_subnet_virtual_network_name = "devops-shr-rg-01-vnet"
    azurerm_subnet_prefixes             = ["10.0.0.0/24", "10.0.1.0/24"]
    azurerm_subnet_delegation           = [
        {
            name = "delegation"
            service_delegation = {
                name    = "Microsoft.Databricks/workspaces"
                actions = [
                    "Microsoft.Network/virtualNetworks/subnets/join/action", 
                    "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"
                ]
            }
        }
    ]
}

```
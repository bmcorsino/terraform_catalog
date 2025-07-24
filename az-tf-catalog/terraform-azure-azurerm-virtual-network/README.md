# terraform-azurerm-virtual-network

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/virtual_network.html

## Create a basic network in Azure

This Terraform module deploys a Virtual Network in Azure

The module does not create nor expose a security group. This would need to be defined separately as additional security rules on subnets in the deployed network.

## Usage

```hcl
module "virtual-network" {
    source           = "../terraform-azure-azurerm_virtual_network"
    azurerm_virtual_network_name           = "devops-shr-rg-01-vnet"
    azurerm_virtual_network_location       = "West Europe"
    azurerm_virtual_network_resource_group = "devops-shr-rg-01"
    azurerm_virtual_network_address_spaces  = ["10.0.0.0/16"]

    azurerm_virtual_network_tags = {
        App    = "app-name"
        Owner  = "EXxxxx"
        BU     = ""
        Description = "Test virtual network"
        Environment = "Dev"
    }
}

```
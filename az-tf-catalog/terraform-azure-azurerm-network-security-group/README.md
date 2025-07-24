# terraform-azurerm-network-security-group

Official terraform documentation: https://www.terraform.io/docs/providers/azure/r/security_group.html

## Create a basic network security group in Azure

This Terraform module deploys a network security group in Azure


## Usage

```hcl
module "network-security-group" {
    source           = "../terraform-azure-azurerm-network-security-group"
    azurerm_network_security_group_name                = "security-group-1"
    azurerm_network_security_group_location            = "West Europe"
    azurerm_network_security_group_resource_group_name = "devops-shr-rg-01"

    azurerm_network_security_group_tags = {
        App    = "app-name"
        Owner  = "EXxxxx"
        BU     = ""
        Description = "Test nsg"
        Environment = "Dev"
    }
}

```
# terraform-azurerm-network-security-rule

Official terraform documentation: https://www.terraform.io/docs/providers/azure/r/security_group_rule.html

## Create a network security rule in Azure

This Terraform module deploys a network security rule in a pre-existing network security group in Azure


## Usage

```hcl
module "allow-ssh" {
  source                                                    = "../terraform-azure-azurerm-network-security-rule"
  azurerm_network_security_rule_name                        = "ssh"
  azurerm_network_security_rule_priority                    = 300
  azurerm_network_security_rule_direction                   = "Inbound"
  azurerm_network_security_rule_access                      = "Allow"
  azurerm_network_security_rule_protocol                    = "TCP"
  azurerm_network_security_rule_source_port_range           = "*"
  azurerm_network_security_rule_destination_port_range      = 22
  azurerm_network_security_rule_source_address_prefix       = "*"
  azurerm_network_security_rule_destination_address_prefix  = "*"
  azurerm_network_security_rule_resource_group_name         = "devops-shr-rg-01"
  azurerm_network_security_rule_network_security_group_name = "security-group-1"
}

```
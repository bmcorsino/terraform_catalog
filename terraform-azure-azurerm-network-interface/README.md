# terraform-azurerm-network-interface

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/network_interface.html

## Create a network interface in Azure existing network

This Terraform module deploys a network interface in Azure

## Usage example

```hcl
module "network-interface" {
    source = "../terraform-azure-azurerm-network-interface"
    azurerm_network_interface_count                                           =1
    azurerm_network_interface_name                                            = "network-interface-01"
    azurerm_network_interface_resource_group_location                         = "West Europe"
    azurerm_network_interface_resource_group_name                             = "devops-shr-rg-01"

    ## IP address specific configurations
    azurerm_network_interface_ip_configuration_name                           = "eth0"
    azurerm_network_interface_ip_configuration_subnet_id                      = "subnet-id"
    azurerm_network_interface_tags = {
        App    = "app-name"
        Owner  = "EXxxxx"
        BU     = ""
        Description = "Test network interface"
        Environment = "Dev"
    }
}
```

## Extra parameters

```hcl
    # Use only when needed to associate with a created security group
    azurerm_network_interface_network_security_group_id                       = "${var.security_group_id}

    # Use only if accelerated network is needed
    azurerm_network_interface_enable_accelerated_networking                   = "true"

    # Use when a static internal IP Address is needed
    azurerm_network_interface_ip_configuration_private_ip_address_allocation  = "static"
    
    # Use this when ip allocation is set to static to define the internal ip address
    azurerm_network_interface_ip_configuration_private_ip_address             = "192.168.1.0

    # When an external IP address is needed, we should create it and paste the id
    azurerm_network_interface_ip_configuration_public_ip_address_id           = "${var.external_ip.id}"

```

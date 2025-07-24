# terraform-azurerm-postgresql-server-firewall-rule

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/postgresql_virtual_firewall_rule.html

We recommend to never call this module with sensitive information explicit on the main file. Instead, it's a better approach to pass it as a variable like:

```
terraform plan
```

## Create a PostgreSQL database virtual firewall rule

This Terraform module deploys a PostgreSQL Virtual Firewall Rule in Azure

## Usage example

```hcl
module "azurerm-postgresql-server-firewall-rule-01" {
    source = "../terraform-azure-azurerm-postgresql-server-firewall-rule"
    azurerm_postgresql_server_firewall_rule_name = "devops-shr-rg-01-vnet-rule-01"
    azurerm_postgresql_server_firewall_rule_resource_group_name = "devops-shr-rg-01"
    azurerm_postgresql_server_firewall_rule_server_name = "postgresql-instance-01"
    azurerm_postgresql_server_firewall_rule_start_ip_address = "0.0.0.0"
    azurerm_postgresql_server_firewall_rule_end_ip_address = "0.0.0.0"
}
```

## Note

The Azure feature Allow access to Azure services can be enabled by setting start_ip_address and end_ip_address to 0.0.0.0
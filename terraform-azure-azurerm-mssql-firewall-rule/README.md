# terraform-azure-azurerm-sql-firewall-rule

Official terraform documentation: <https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_firewall_rule>

## Create a SQL Firewall Rule

This Terraform module a Azure MSSQL Firewall Rule

## Usage example

```hcl
module "app_mssql_firewall_rule" {
    azurerm_mssql_firewall_rule_list      = [
        {
            name                = "azservices"
            start_ip_address    = "0.0.0.0"
            end_ip_address      = "0.0.0.0"
            server_id           = "server-id"
        },
        {
            name                = "dxc1"
            start_ip_address    = "195.245.180.0"
            end_ip_address      = "195.245.180.255"
            server_id           = "server-id"
        },
        {
            name                = "dxc2"
            start_ip_address    = "195.245.185.0"
            end_ip_address      = "195.245.185.255"
            server_id           = "server-id"
        },
        {
            name                = "dxc3"
            start_ip_address    = "185.58.80.0"
            end_ip_address      = "185.58.80.255"
            server_id           = "server-id"
        }
    ]
}
```
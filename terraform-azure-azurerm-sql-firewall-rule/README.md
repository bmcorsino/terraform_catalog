# terraform-azure-azurerm-sql-firewall-rule

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/sql_firewall_rule.html>

## Create a SQL Firewall Rule

This Terraform module a Azure SQL Firewall Rule

## Usage example

```hcl
module "app_sql_firewall_rule" {
    azurerm_sql_firewall_rule_list      = [
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
# terraform-azurerm-analysis-services-server

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/analysis_services_server.html>

## Create a Analysis Services Server

This Terraform module creates a Analysis Services Server.

## Usage example

```hcl
module "analysis-services-server" {
    source = "./terraform-azure-azurerm-analysis-services-server"
    azurerm_analysis_services_server_resource_group_name       = "appname-dev-rg-01"
    azurerm_analysis_services_server_location                  = "westeurope"
    azurerm_analysis_services_server_name                      = "appnamedevanalysisrv"
    azurerm_analysis_services_server_list                      = [
            suffix                      = "" // default 01
            sku                         = "S0" // Possible values are: D1, B1, B2, S0, S1, S2, S4, S8 and S9 - default S0
            admin_users                 = ["ex00000@kpmg.pt"] // optional - default empty
            querypool_connection_mode   = "All" // All|ReadOnly - optional - default All
            backup_blob_container_uri   = "" // URI and SAS token for a blob container - optional - default empty
            enable_power_bi_service     = true // optional - default true
            ipv4_firewall_rule          = [ // optional - default empty
                    {
                        name        = "MyClientIP"
                        range_start = "10.0.0.0"
                        range_end   = "10.0.0.255"
                    }
            ]
    ]
}
```
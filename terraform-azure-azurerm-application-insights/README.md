# terraform-azurerm-application-insights

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/application_insights.html>

## Create a Application Insights

This Terraform module creates a Application Insights

## Usage example

```hcl
module "application-insights" {
    azurerm_application_insights_resource_group_name    = "appname-dev-rg-01"
    azurerm_application_insights_location               = "westeurope"
    azurerm_application_insights_name_prefix            = "appname-dev"
    azurerm_application_insights_list                   = [
        {
            suffix                  = ""
            role                    = ""
            application_type        = "web"     // Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET
            retention_in_days       = 90        // Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90.
            api_key                 = {
                read_permissions        = ["agentconfig", "aggregate", "api", "draft", "extendqueries", "search"]
                write_permissions       = ["annotations"]
            }
        }
    ]
}
```
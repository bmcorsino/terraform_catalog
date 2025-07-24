# terraform-azure-azurerm-template-deployment-ipwhitelist
https://github.com/terraform-providers/terraform-provider-azurerm/issues/3685

## Assigns IP restriction to Azure App Service
.
## Simple Usage

```hcl

module "template_deployment_ipwhitelist" {
    source                           = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-template-deployment-ipwhitelist.git"
    azurerm_app_service_resource_group_name       = "iac-dev-rg-01"
    azurerm_app_service_name                      = "jenkinsdevwebapp01"
}
```

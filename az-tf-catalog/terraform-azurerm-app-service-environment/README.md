# terraform-azurerm-app-service-environment

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/app_service_environment.html

## Create a basic App Service Environment

This Terraform module deploys a App Service Environment in Azure

## Usage

```hcl
module "azurerm-app-service-environment" {
    source           = "../terraform-azurerm-app-service-environment"
    azurerm_app_service_environment_name    = "ase-ENV}-ase"
    azurerm_app_service_environment_list    = [
        ase_data = {
            ase_subnet_id_if_exists         = ""        // default value "" (empty) [Exemplo: /subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Network/virtualNetworks/<VNET-NAME>/subnets/<SUBNET-NAME>]
            ase_suffix                      = "77"      // default value "01"
            pricing_tier                    = "I2"      // Possible values are I1, I2 and I3. Defaults to I1
            front_end_scale_factor          = "10"      // Possible values are between 5 and 15. Defaults to 15.
            internal_load_balancing_mode    = "None"    // Possible values are None, Web and Publishing. Defaults to None.
        }
    ]
    # OPTIONAL IF SUBNET INFORMED IN LIST ABOVE
    azurerm_subnet_list                     = [
        /subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Network/virtualNetworks/<VNET-NAME>/subnets/<SUBNET-NAME>,
        /subscriptions/<SUBSCRIPTION-ID>/resourceGroups/<RG-NAME>/providers/Microsoft.Network/virtualNetworks/<VNET-NAME>/subnets/<SUBNET-NAME>
    ]
}
```
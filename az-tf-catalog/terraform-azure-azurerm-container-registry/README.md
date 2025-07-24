# terraform-azurerm-container-registry

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/container_registry.html

# Usage
We recommend to never call this module with sensitive information explicit on the main file. Instead, it's a better approach to pass it as a variable like:

```
terraform plan -var "azurerm_container_registry_service_principal_client_secret=secret"
```

## Create a new container registry

This Terraform module deploys a simple container registry. New versions will provide more features

## Usage example

# Simple Cluster without network parameters

```hcl
module "container-registry-dev" {
  source               = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-container-registry.git"
  azurerm_container_registry_name                 = "container-registry-name"
  azurerm_container_registry_location             = "West Europe"
  azurerm_container_registry_resource_group_name  = "devops-dev-rg-01"
  azurerm_container_registry_tags                 = {
    app = xxx
  }
}
```

## Extra parameters

```hcl
# The SKU name of the the container registry. Possible values are: Basic, Stardard or Premium (default). 
  azurerm_container_registry_sku = "Standard"
```
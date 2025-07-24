# terraform-azure-azuread-service-principal-data

## Obtain service principal data from Azure AD

This Terraform module reads service principal object data from Azure AD to later be used in a module that assigns roles. Other groups, users and service principals can be present in the same list variable

## Simple Usage

```hcl

// declare the userad provider
provider "azuread" {
    version = "~> 0.6"
}

// get service principals data
module "service_principal_data" {
    source                 = "./terraform-azure-azuread-service-principal-data"

    azuread_objects_array  = [
        {
          resource  = "appnm-dev-rg-02"
          type      = "service_principal"
          name      = "TerraformSP"
          role      = "Contributor"
        },
    ]
}
```

## Advanced Usage

```hcl
// declare the userad provider
provider "azuread" {
    version = "~> 0.6"
}

// get service principals data
module "service_principal_data" {
    source                 = "./terraform-azure-azuread-service-principal-data"

    azuread_objects_array  = [
        {
          resource  = "appnm-dev-rg-01"
          type      = "user_principal_name"
          name      = "ex99999@kpmg.pt"
          role      = "Contributor"
        },
        {
          resource  = "appnm-dev-rg-02"
          type      = "user_principal_name"
          name      = "ex99999@kpmg.pt"
          role      = "Contributor"
        },
        {
          resource  = "appnm-dev-rg-01"
          type      = "group"
          name      = "SomeAADGroup"
          role      = "Contributor"
        },
        {
          resource  = "appnm-dev-rg-01"
          type      = "group"
          name      = "OtherAADGroup"
          role      = "owner"
        },
        {
          resource  = "appnm-dev-rg-02"
          type      = "service_principal"
          name      = "TerraformSP"
          role      = "Contributor"
        },
    ]
}

```

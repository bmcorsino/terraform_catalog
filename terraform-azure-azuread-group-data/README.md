# terraform-azure-azuread-group-data

## Obtain group data from Azure AD

This Terraform module reads group object data from Azure AD to later be used in a module that assigns roles. Other groups, users and service principals can be present in the same list variable

## Simple Usage

```hcl

// declare the userad provider
provider "azuread" {
    version = "~> 0.6"
}

// get groups data
module "group_data" {
    source                 = "./terraform-azure-azuread-group-data"

    azuread_objects_array  = [
        {
            resource  = "appnm-dev-rg-01"
            type      = "group"
            name      = "SomeAADGroup"
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

// get groups data
module "group_data" {
    source                 = "./terraform-azure-azuread-group-data"

    azuread_objects_array  = [
        {
          resource  = "appnm-dev-rg-01"
          type      = "user_principal_name"
          name      = "ex99999@dxc.pt"
          role      = "Contributor"
        },
        {
          resource  = "appnm-dev-rg-02"
          type      = "user_principal_name"
          name      = "ex99999@dxc.pt"
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

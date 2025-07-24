# terraform-azure-azurerm-role-assignment

## Assigns an Azure AD object and role to a resource

This Terraform module assigns permission roles for objects from Azure AD to a resource.
To assign the role of each type of object it uses the output of the modules that get the  data from Azure AD

Groups:
  azurerm_role_assignment_principal_map   = module.group_data.group_data_output
Users:
  azurerm_role_assignment_principal_map   = module.user_data.user_data_output
Service Principal:
  azurerm_role_assignment_principal_map   = module.service_principal_data.service_principal_data_output

Resource (map with a resource id):
  azurerm_role_assignment_resource_map    = module.resource_group.resource_group_output

## Simple Usage

```hcl

module "role_assignment_user" {
    source                                  = "../terraform-azure-azurerm-role-assignment"
    azurerm_role_assignment_principal_map   = module.group_data.group_data_output
    azurerm_role_assignment_resource_map    = module.resource_group.resource_group_output
    azurerm_role_assignment_array           = [
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
module "role_assignment_user" {
    source                                  = "../terraform-azure-azurerm-role-assignment"
    azurerm_role_assignment_principal_map   = module.group_data.group_data_output
    azurerm_role_assignment_resource_map    = module.resource_group.resource_group_output
    azurerm_role_assignment_array           = [
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
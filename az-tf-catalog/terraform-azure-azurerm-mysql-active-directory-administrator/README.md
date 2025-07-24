# terraform-azure-azurerm-mysql-active-directory-administrator

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/mysql_active_directory_administrator.html

## Create a Mysql Active Directory Administrator

This Terraform module deploys a Mysql Active Directory Administrator in Azure

## Usage example

```hcl
module "azurerm-mysql-active-directory-administrator" {
    azurerm_resource_group_name                = "appname-dev-rg-01" // my-dev-rg-01
    azurerm_mysql_server_list                  = [
        {
            login           = "EX00000@kpmg.pt"
            azuread_user    = "EX00000@kpmg.pt"
            server_name     = "<application>-<environment>-mysql[-ROLE]-<seq number>"
        },
        {
            login           = "EX00000@kpmg.pt"
            azuread_user    = "EX00000@kpmg.pt"
            server_name     = "<application>-<environment>-mysql[-ROLE]-<seq number>"
        }
    ]
}
```
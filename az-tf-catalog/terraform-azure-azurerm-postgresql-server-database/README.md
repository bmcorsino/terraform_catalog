# terraform-azurerm-postgresql-server

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/postgresql_server.html

We recommend to never call this module with sensitive information explicit on the main file. Instead, it's a better approach to pass it as a variable like:

```
terraform plan -var "azurerm_postgresql_server_administrator_login_pwd=password"
```

## Create a PostgreSQL database

This Terraform module deploys a PostgreSQL in Azure

## Usage example

```hcl
module "postgres-server" {
    source = "../terraform-azure-azurerm-postgresql-server"
    azurerm_postgresql_server_name = "server-name"
    azurerm_postgresql_server_location = "West Europe"
    azurerm_postgresql_server_resource_group_name = "devops-shr-rg-01"
    azurerm_postgresql_server_sku_name = "GP_Gen5_2"
    azurerm_postgresql_server_sku_capacity = "2"
    azurerm_postgresql_server_sku_tier = "GeneralPurpose"
    azurerm_postgresql_server_sku_family = "Gen5"
    azurerm_postgresql_server_storage_profile_storage_mb = "102400"
    azurerm_postgresql_server_administrator_login = "admin"
    azurerm_postgresql_server_administrator_login_pwd = ""
    azurerm_postgresql_server_version = "10"
}
```

## Extra parameters

```hcl
    # Azure PostgreSQL server storage geo redundant backup
    azurerm_postgresql_server_storage_profile_geo_redundant_backup = "enabled"

    # Azure PostgreSQL server storage retention days
    azurerm_postgresql_server_storage_profile_backup_retention_days = 7

    # Azure PostgreSQL server SSL enforcement
    azurerm_postgresql_server_ssl_enforcement = "enabled"
```
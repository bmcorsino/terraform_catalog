# terraform-azurerm-machine-learning-workspace

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/machine_learning_workspace.html>

## Create a Machine Learning Workspace

This Terraform module creates a Machine Learning Workspace.

## Usage example

```hcl
module "machine-learning-workspace" {
    azurerm_machine_learning_workspace_resource_group_name    = "appname-dev-rg-01"
    azurerm_machine_learning_workspace_location               = "westeurope"
    azurerm_machine_learning_workspace_name_prefix            = "appname-dev"
    azurerm_machine_learning_workspace_list                   = [
        {
            suffix                    = ""
            role                      = ""
            application_insights_id   = "/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/microsoft.insights/components/app-dev-appinsights-01"
            key_vault_id              = "/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.KeyVault/vaults/app-dev-keyvault-01"
            storage_account_id        = "/subscriptions/<subscription-id>/resourceGroups/<rg-name>/providers/Microsoft.Storage/storageAccounts/appudevtr01"
            sku_name                  = "Basic"
        }
    ]
}
```
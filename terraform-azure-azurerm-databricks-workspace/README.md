# DXC Databricks

Databricks delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12 and 13
  - Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/databricks_workspace.html>

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Databricks](#databricks)
- [Output](#output)

## Databricks<a name="databricks"></a>
```bash
module "databricks-workspace" {
    azurerm_databricks_workspace_name                   = "appname-dev-databricks"
    azurerm_databricks_workspace_location               = "Westeurope"
    azurerm_databricks_workspace_resource_group_name    = "my-dev-rg-01"

    azurerm_databricks_workspace_list       = [
        {
            suffix               = ""           // default empty
            tier                 = "standard"   // standard, premium, or trial
        }
    ]
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.databricks-workspace.main
}
```
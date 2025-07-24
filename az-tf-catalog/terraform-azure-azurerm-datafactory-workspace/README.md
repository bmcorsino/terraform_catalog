# kpmg Datafactory

Datafactory delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12 and 13
  - Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/data_factory.html>

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [kpmg Datafactory](#kpmg-datafactory)
  - [Any questions or suggestion?](#any-questions-or-suggestion)
  - [Run terraform](#run-terraform)
  - [Index](#index)
  - [Datafactory](#datafactory)
  - [Extra fields](#extra-fields)
  - [Output](#output)

## Datafactory<a name="datafactory"></a>
```bash
module "datafactory-workspace" {
    azurerm_datafactory_workspace_name                    = "appname-dev-datafactory"
    azurerm_datafactory_workspace_location                = "Westeurope"
    azurerm_datafactory_workspace_resource_group_name     = "my-dev-rg-01"
    azurerm_datafactory_count                             = 1
}
```

## Extra fields<a name="extra-fields"></a>
Available fields for extra Datafactory settings

**fields:** `Datafactory`
```bash
    ...
    ...
    ...
    azurerm_datafactory_role            = "" // default empty
    azurerm_datafactory_start_suffix    = 1 // portanto fica 04, 05, 06. [default 1]
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.datafactory-workspace.main
}
```
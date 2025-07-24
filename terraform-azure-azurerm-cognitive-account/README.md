# DXC CognitiveAccount

CognitiveAccount delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [CognitiveAccount](#CognitiveAccount)
- [Output](#output)

## CognitiveAccount<a name="CognitiveAccount"></a>
```bash
module "terraform-azure-azurerm-cognitive-account" {
    source = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-cognitive-account.git"

    name                = "<application>-<environment>-cognitive[-role]-<seq number>"
    location            = "westeurope"
    resource_group_name = "appname-dev-rg-01" // my-dev-rg-01
    kind                = "LUIS"
    sku_name            = "F0"
    tags                = {}
    qna_runtime_endpoint= null
}
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.terraform-azure-azurerm-cognitive-account.main
}
```
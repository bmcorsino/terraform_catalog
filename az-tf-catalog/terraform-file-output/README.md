# kpmg FileOutput

FileOutput delivery according to model and value combinations, below are the tested and validated examples

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [kpmg FileOutput](#kpmg-fileoutput)
  - [Any questions or suggestion?](#any-questions-or-suggestion)
  - [Run terraform](#run-terraform)
  - [Index](#index)
  - [FileOutput](#fileoutput)
  - [Extra fields](#extra-fields)

## FileOutput<a name="file-output"></a>
```bash
module "kpmg-file-output" {
    source                      = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ickpmg/terraform-file-output.git"
    
    azurerm_resource_output     = [
        {
            "storage_account_1" = {
            "fqdn" = "appname80.privatelink.blob.core.windows.net"
            "ips" = "127.0.0.1"
            "name" = "appname80"
            }
        },
        {
            "storage_account_2" = {
            "fqdn" = "appname81.privatelink.blob.core.windows.net"
            "ips" = "127.0.0.2"
            "name" = "appname81"
            }
        }
    ]
}
```

## Extra fields<a name="extra-fields"></a>
Available fields for extra FileOutput settings

**kpmg-file-output:** `FileOutput`
```bash
    {
        ...
        ...
        ...
        output_file                 = ".output"
        azurerm_resource_depends_on = [""] // default empty
    }
```
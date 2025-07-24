# kpmg Keyvault

Keyvault delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12, 13 and 14

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Keyvault<a name="Keyvault"></a>
```bash
module "azurerm-key-vault" {
    source = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/ica/terraform-azure-azurerm-key-vault.git?ref=v.2.0.0"

    azurerm_key_vault_name                          = "<application>-<environment>-keyvault[-ROLE]-<seq number>"
    azurerm_key_vault_location                      = "westeurope"
    azurerm_key_vault_resource_group_name           = "appname-dev-rg-01"
    azurerm_key_vault_enabled_for_disk_encryption   = true
    azurerm_key_vault_tenant_id                     = "<tenant-id>"
    azurerm_key_vault_purge_protection_enabled      = true
    azurerm_key_vault_sku_name                      = "standard"
    azurerm_key_vault_tags                          = {}
    azurerm_key_vault_access_policy_list            = [
        {
            tenant_id       = "<tenant-id>"
            application_id  = "<application-id>"|null
            object_id       = "<object-id>"|null
            key_permissions         = ["backup","create","decrypt","delete","encrypt","get","import","list","recover","restore","sign","unwrapKey","update","verify","wrapKey"] // backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey
            secret_permissions      = ["get","list"] // backup, delete, get, list, purge, recover, restore and set
            storage_permissions     = ["get","list","set","delete","update","backup","restore"] // backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update
            certificate_permissions = [] // backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update
        }
    ]
    azurerm_key_vault_network_acls_list             = [
        {
            default_action      = "Deny"
            bypass              = "AzureServices"
            ip_rules            = []
        }
    ]
}
```

## Output<a name="Keyvault-output"></a>
```bash
output "main" {
    value = module.azurerm-key-vault.main
}
```
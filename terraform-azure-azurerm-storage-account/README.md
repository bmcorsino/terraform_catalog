# DXC StorageAccount

StorageAccount delivery according to model and value combinations, below are the tested and validated examples.

  - Terraform 12 and 13

## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [StorageAccount](#storage-account)
- [Extra fields](#extra-fields)
- [Output](#output)

## StorageAccount<a name="storage-account"></a>
```bash
module "storage-account" {
    azurerm_resource_group_name                 = "my-dev-rg-01"
    azurerm_resource_location                   = "Westeurope"
    azurerm_storage_account_name                = "appnamedevstr"

    azurerm_storage_account_list                = [
        {
            account_tier            = "Standard"    // Valid options are Standard and Premium. For FileStorage accounts only Premium is valid.
            account_kind            = "StorageV2"   // Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2   
        }
    ]
}

## Extra fields<a name="extra-fields"></a>
Available fields for extra StorageAccount settings

**azurerm_storage_account_list:** `StorageAccount`
```bash
    {
        ...
        ...
        ...
        account_suffix                      = ""    // default empty
        is_hns_enabled                      = true  // This can be used with Azure Data Lake Storage Gen 2
        access_tier                         = "Hot" // Valid options are Hot and Cool, defaults to Hot
        account_replication_type            = "GRS" // Valid options are LRS, GRS, RAGRS and ZRS
        allow_nested_items_to_be_public     = true  // Default true
        min_tls_version                     = "TLS1_2" // optional - default "TLS1_2"
        blob_delete_retention_policy_days   = 14    // optional - default 14
        # Private Endpoint
        private_endpoint_role               = ""     // optional - default empty
        private_endpoint_subresource_name   = "blob" // blob, table, queue, file, web, dfs - [default is blob]
        private_endpoint_role               = "blob"
        private_endpoint_role_env           = "" // default empty
    }
```

## Output<a name="output"></a>
```bash
output "main" {
  value = module.storage-account.azurerm_storage_account_main
}
```
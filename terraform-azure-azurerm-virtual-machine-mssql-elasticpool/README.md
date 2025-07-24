## Usage
.
```hcl
module "mssql-elasticpool-vm-iaas" {
    source = "./mssql-elasticpool-vm-iaas"

    azure_mssql_elasticpool             = "${var.azure_mssql_elasticpool}"
    name                                = "${var.app_name}${var.environment}${var.tier}${local.sub_env_resources}${var.sufix}-epool"
    resource_group_name                 = "${var.azurerm_resource_group_name}"
    location                            = "${var.azure_region}"
    server_name                         = "${var.app_name}${var.environment}${var.tier}${local.sub_env_resources}${var.sufix}"
    max_size_gb                         = "${var.azure_elasticpool_max_size_gb}"

    per_database_settings_max_capacity  = "${var.max_databases}"
    sku_capacity                        = "${var.max_databases}"
}
```
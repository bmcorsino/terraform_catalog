# terraform-azurerm-data-lake-store

Official terraform documentation: <https://www.terraform.io/docs/providers/azurerm/r/data_lake_store.html>

## Create a Azure Data Lake

This Terraform module creates a Azure Data Lake.

## Usage example

```hcl
module "data-lake-store" {
    source = "./terraform-azure-azurerm-data-lake-store"
    azurerm_data_lake_name                   = "${var.app_name}${var.environment}str"
    azurerm_data_lake_location               = "${var.azure_region}"
    azurerm_data_lake_resource_group_name    = "${var.azurerm_resource_group_name}"

    azurerm_data_lake_list                   = [
        {
            suffix               = "" // default empty
            role                 = "" // default empty
            tier                 = "Consumption" // Accepted values are Consumption, Commitment_1TB, Commitment_10TB, Commitment_100TB, Commitment_500TB, Commitment_1PB or Commitment_5PB.
            encryption_type      = "ServiceManaged"
            encryption_type      = "Enabled"
        },
        {
            suffix               = "05" // default empty
            role                 = "" // default empty
            tier                 = "Consumption" // Accepted values are Consumption, Commitment_1TB, Commitment_10TB, Commitment_100TB, Commitment_500TB, Commitment_1PB or Commitment_5PB.
            encryption_type      = "ServiceManaged"
            encryption_type      = "Enabled"
        },
        {
            suffix               = "09" // default empty
            role                 = "" // default empty
            tier                 = "Consumption" // Accepted values are Consumption, Commitment_1TB, Commitment_10TB, Commitment_100TB, Commitment_500TB, Commitment_1PB or Commitment_5PB.
            encryption_type      = "ServiceManaged"
            encryption_type      = "Enabled"
        }
    ]
}
```
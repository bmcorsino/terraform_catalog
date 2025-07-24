resource "azurerm_mssql_elasticpool" "main" {
  count               = "${var.azure_mssql_elasticpool == true ? 1 : 0}"
  name                = "${var.name}"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  server_name         = "${var.server_name}"
  license_type        = "${var.license_type}"
  max_size_gb         = "${var.max_size_gb}"

  sku {
    name              = "${var.sku_name}"
    tier              = "${var.sku_tier}"
    family            = "${var.sku_family}"
    capacity          = "${var.sku_capacity}"
  }

  per_database_settings {
    min_capacity      = "${var.per_database_settings_min_capacity}"
    max_capacity      = "${var.per_database_settings_max_capacity}"
  }

  tags                = "${var.azurerm_mssql_elastcpool_tags}"
}
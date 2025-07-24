resource "azurerm_data_factory" "main" {
    count                   = var.azurerm_datafactory_count

    name                    = "${var.azurerm_datafactory_workspace_name}${local.role}-${count.index + local.autoincrement < 10 ? "0" : ""}${count.index + local.autoincrement}"
    resource_group_name     = var.azurerm_datafactory_workspace_resource_group_name
    location                = var.azurerm_datafactory_workspace_location

    identity {
        type = "SystemAssigned"
    }
    tags                    = var.tags
}
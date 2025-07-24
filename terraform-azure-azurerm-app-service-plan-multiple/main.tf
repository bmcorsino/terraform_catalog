resource "azurerm_service_plan" "main" {
    count                           = var.service_plan_standard_count
    name                            = var.name
    sku_name                        = var.sku_name
    os_type                         = var.os_type
    maximum_elastic_worker_count    = local.maximum_elastic_worker_count
    tags                            = var.tags
    location                        = var.location
    resource_group_name             = var.resource_group_name

    timeouts {
        create = "2h"
        update = "2h"
        delete = "2h"
    }
    depends_on                      = [var.azurerm_resource_depends_on]
}

resource "azurerm_service_plan" "main-ase" {
    count                           = var.service_plan_ase_count
    name                            = var.name
    sku_name                        = var.sku_name
    os_type                         = var.os_type
    maximum_elastic_worker_count    = local.maximum_elastic_worker_count
    tags                            = var.tags
    location                        = var.location
    resource_group_name             = var.resource_group_name
    app_service_environment_id      = var.service_plan_ase_environment_id

    timeouts {
        create = "2h"
        update = "2h"
        delete = "2h"
    }
    depends_on                      = [var.azurerm_resource_depends_on]
}
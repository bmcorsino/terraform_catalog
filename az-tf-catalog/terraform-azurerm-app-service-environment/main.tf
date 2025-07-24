resource "azurerm_app_service_environment" "main" {
    for_each            = local.azurerm_ase_list

    name                            = "${var.azurerm_app_service_environment_name}-${each.value.suffix}"
    subnet_id                       = each.value.subnet_id
    pricing_tier                    = each.value.pricing_tier
    front_end_scale_factor          = each.value.front_end_scale_factor
    internal_load_balancing_mode    = each.value.internal_load_balancing_mode
}
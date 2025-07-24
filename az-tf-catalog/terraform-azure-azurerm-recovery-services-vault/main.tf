
resource "azurerm_recovery_services_vault" "main" {
 
  name                      = "${var.azurerm_recovery_services_vault_appname}${var.azurerm_recovery_services_vault_environment}vault01"
  resource_group_name       = "${var.azurerm_recovery_services_vault_rgname}"
  location                  = "${var.azurerm_recovery_services_vault_location}"
  tags                      = "${var.azurerm_recovery_services_vault_tags}"
  sku                       = "${var.azurerm_recovery_services_vault_sku}"
  

}
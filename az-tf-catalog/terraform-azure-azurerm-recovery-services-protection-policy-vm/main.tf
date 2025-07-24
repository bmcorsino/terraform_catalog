
resource "azurerm_recovery_services_protection_policy_vm" "main" {
 
  name                      = "${var.azurerm_recovery_services_vault_policy_appname}${var.azurerm_recovery_services_vault_policy_environment}-policy01"
  resource_group_name       = "${var.azurerm_recovery_services_vault_policy_rgname}"
  recovery_vault_name       = "${var.azurerm_recovery_services_vault_policy_vault_name}"
 
   backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }

  retention_weekly {
    count    = 4
    weekdays = ["Sunday", "Wednesday", "Friday", "Saturday"]
  }

  retention_monthly {
    count    = 6
    weekdays = ["Sunday", "Wednesday"]
    weeks    = ["First", "Last"]
  }


}
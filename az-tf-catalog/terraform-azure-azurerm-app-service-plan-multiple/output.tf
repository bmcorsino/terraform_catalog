output "main" {
  value = concat(
    azurerm_service_plan.main,
    azurerm_service_plan.main-ase)
}
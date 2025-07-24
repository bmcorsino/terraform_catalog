output "main" {
  value = concat(
    azurerm_app_service.main,
    azurerm_app_service.main_windows)
}
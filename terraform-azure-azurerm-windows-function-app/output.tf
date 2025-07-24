output "main" {
  value = concat(
    azurerm_windows_function_app.main,
    azurerm_windows_function_app.main_consumption)
}
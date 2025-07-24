output "main" {
  value = concat(
    azurerm_function_app.main,
    azurerm_function_app.main_consumption)
}
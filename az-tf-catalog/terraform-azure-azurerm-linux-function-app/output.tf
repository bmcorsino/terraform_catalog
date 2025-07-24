output "main" {
  value = concat(
    azurerm_linux_function_app.main,
    azurerm_linux_function_app.main_consumption)
}
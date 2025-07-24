output "main" {
  value = concat(
    azurerm_windows_web_app.main_windows)
}
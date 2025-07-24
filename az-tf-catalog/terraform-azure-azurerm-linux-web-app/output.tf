output "main" {
  value = concat(
    azurerm_linux_web_app.main_linux)
}
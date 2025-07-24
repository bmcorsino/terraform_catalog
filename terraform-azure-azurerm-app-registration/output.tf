output "main" {
  value = azuread_application.main
  sensitive = true
}
output "value" {
  value = azuread_application_password.main.value
  sensitive = true
}
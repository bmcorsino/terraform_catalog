output "access_endpoint" {
  value = azurerm_logic_app_workflow.main.*.access_endpoint
}
output "id" {
  value = azurerm_logic_app_workflow.main.*.id
}
output "main" {
  value = azurerm_logic_app_workflow.main
}

output "automation_account_id" {
  description = "Azure Automation Account"
  value       = "${azurerm_automation_account.main.id}"
}
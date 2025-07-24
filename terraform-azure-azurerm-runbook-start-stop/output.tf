output "automation_runbook_name" {
  description = "Azure Automation Account"
  value       = "${azurerm_automation_runbook.main.*.name}"
}
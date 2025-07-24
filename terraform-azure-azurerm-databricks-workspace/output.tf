output "azurerm_databricks_workspace_id" {
  value = { 
    for k, v in azurerm_databricks_workspace.main : 
        k => v.id
  }
}

output "main" {
  value = azurerm_databricks_workspace.main
}
output "azurerm_dashboard_output" {
  description = "dashboard"
  value       = { 
    for k, v in (var.azurerm_dashboard_name_if_exists == "" ? {(length(var.azurerm_dashboard_resource) == 0 ? var.azurerm_dashboard_name : var.azurerm_dashboard_resource[0]) = azurerm_dashboard.main[0]} : {}) : 
        k => {
          for i, u in v : 
            i => u
              if 
                i != "dashboard_properties" &&
                i != "tags" &&
                i != "timeouts"
        }
  }
}
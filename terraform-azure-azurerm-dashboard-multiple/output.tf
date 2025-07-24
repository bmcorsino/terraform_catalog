output "azurerm_dashboard_output" {
  description = "dashboard" # "-"
  value       = { 
      for k, v in azurerm_dashboard.main : 
        k => {
          for i, u in v : 
            i => u
              if 
                i != "dashboard_properties"
        }
  }
}
output "azurerm_dashboard_map_output" {
  value       = local.dashboard_map
}
output "azurerm_dashboard_tags_map_output" {
  value       = local.dashboard_tags_map
}

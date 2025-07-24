output "template_deployment_budget_output" {
  # value = local.azurerm_template_deployment_budget_merged_map
  value = { 
    for k, v in azurerm_template_deployment.main : 
        k => {
          for i, u in v : 
            i => u
              if 
                i != "template_body" &&
                i != "parameters" &&
                i != "outputs"
        }
  }
}

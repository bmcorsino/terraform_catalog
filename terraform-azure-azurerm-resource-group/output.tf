output "resource_group_output" {
  value = { 
    for k, v in azurerm_resource_group.main : 
        k => {
          for i, u in v : 
            i => u
              if i != "tags" && i != "timeouts" // Terraform12 existe a tag timeouts que é um array
        }
  }
}
output "resource_group_tags_output" {
  value = { 
    for k, v in azurerm_resource_group.main : 
        k => v.tags
  }
}

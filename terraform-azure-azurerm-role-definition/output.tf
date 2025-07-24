output "azurerm_role_definition_id" {
  value = { 
    for k, v in azurerm_role_definition.main : 
        k => v.id
  }
}
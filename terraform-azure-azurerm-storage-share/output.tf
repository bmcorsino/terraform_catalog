output "azurerm_storage_share_id" {
  value = { 
    for k, v in azurerm_storage_share.main : 
        k => v.id
  }
}

output "azurerm_storage_share_resource_manager_id" {
  value = { 
    for k, v in azurerm_storage_share.main : 
        k => v.resource_manager_id
  }
}

output "azurerm_storage_share_url" {
  value = { 
    for k, v in azurerm_storage_share.main : 
        k => v.url
  }
}
output "main" {
    value = azurerm_virtual_desktop_host_pool.main
}

output "token" {
    sensitive = true
    value = tonumber(var.token_expiration_date_in_days) > 0 ? azurerm_virtual_desktop_host_pool.main.registration_info[0].token : ""
}
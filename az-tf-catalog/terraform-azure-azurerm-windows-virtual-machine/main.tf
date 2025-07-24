resource "azurerm_windows_virtual_machine" "main" {
    count                            = var.azurerm_windows_virtual_machine_count
    name                             = local.azurerm_vm_list_name[count.index]
    location                         = var.azurerm_windows_virtual_machine_location
    resource_group_name              = var.azurerm_windows_virtual_machine_resource_group_name
    availability_set_id              = var.azurerm_windows_virtual_machine_availability_set_id
    vm_size                          = var.azurerm_windows_virtual_machine_vm_size
    network_interface_ids            = [var.azurerm_windows_virtual_machine_network_interface_ids[count.index]]
    tags                             = var.azurerm_windows_virtual_machine_tags
    license_type                     = var.azurerm_windows_virtual_machine_license_type
    # With Marketplace Image reference
    dynamic "storage_image_reference" {
        for_each = var.azurerm_windows_virtual_machine_os_custom_image_id == null ? [{content: true}] : []
        content {
            publisher       = var.azurerm_windows_virtual_machine_os_publisher
            offer           = var.azurerm_windows_virtual_machine_os_offer
            sku             = var.azurerm_windows_virtual_machine_os_sku
            version         = var.azurerm_windows_virtual_machine_os_version
        }
    }
    # With Custom Image reference
    dynamic "storage_image_reference" {
        for_each = var.azurerm_windows_virtual_machine_os_custom_image_id != null ? [{content: true}] : []
        content {
            id = var.azurerm_windows_virtual_machine_os_custom_image_id
        }
    }
    storage_os_disk {
        name                = "osdisk-${local.azurerm_vm_list_name[count.index]}"
        caching             = var.azurerm_windows_virtual_machine_storage_os_disk_caching
        managed_disk_type   = var.azurerm_windows_virtual_machine_managed_os_disk_type
    }
    
    # OS Profile - WINDOWS
    dynamic "os_profile" {
        for_each = var.azurerm_windows_virtual_machine_is_windows_image ? [{content: true}] : []
        content {
            computer_name       = local.azurerm_vm_list_name[count.index]
            admin_username      = var.azurerm_windows_virtual_machine_os_profile_admin_username
            admin_password      = var.azurerm_windows_virtual_machine_os_profile_admin_password
        }
    }
    # OS Profile Config - WINDOWS
    dynamic "os_profile_windows_config" {
        for_each = var.azurerm_windows_virtual_machine_is_windows_image ? [{content: true}] : []
        content {
            provision_vm_agent        = var.azurerm_windows_virtual_machine_os_profile_windows_provision_vm_agent
            enable_automatic_upgrades = var.azurerm_windows_virtual_machine_os_profile_windows_enable_automatic_upgrades
            timezone                  = var.azurerm_windows_virtual_machine_os_profile_windows_timezone
        }
    }
}
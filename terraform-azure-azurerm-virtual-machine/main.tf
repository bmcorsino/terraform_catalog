resource "azurerm_virtual_machine" "main" {
    count                            = var.azurerm_virtual_machine_count
    name                             = local.azurerm_vm_list_name[count.index]
    location                         = var.azurerm_virtual_machine_location
    resource_group_name              = var.azurerm_virtual_machine_resource_group_name
    availability_set_id              = var.azurerm_virtual_machine_availability_set_id
    vm_size                          = var.azurerm_virtual_machine_vm_size
    network_interface_ids            = [var.azurerm_virtual_machine_network_interface_ids[count.index]]
    delete_os_disk_on_termination    = var.azurerm_virtual_machine_delete_os_disk_on_termination
    delete_data_disks_on_termination = var.azurerm_virtual_machine_delete_data_disks_on_termination
    tags 							 = var.azurerm_virtual_machine_tags
    license_type                     = var.azurerm_virtual_machine_is_windows_image ? var.azurerm_virtual_machine_license_type : null
    # With Marketplace Image reference
    dynamic "storage_image_reference" {
        for_each = var.azurerm_virtual_machine_os_custom_image_id == null ? [{content: true}] : []

        content {
            publisher       = var.azurerm_virtual_machine_os_publisher
            offer           = var.azurerm_virtual_machine_os_offer
            sku             = var.azurerm_virtual_machine_os_sku
            version         = var.azurerm_virtual_machine_os_version
        }
    }
    # With Custom Image reference
    dynamic "storage_image_reference" {
        for_each = var.azurerm_virtual_machine_os_custom_image_id != null ? [{content: true}] : []

        content {
            id = var.azurerm_virtual_machine_os_custom_image_id
        }
    }
    storage_os_disk {
        name                = "osdisk-${local.azurerm_vm_list_name[count.index]}"
        create_option       = var.azurerm_virtual_machine_storage_os_disk_create_option
        caching             = var.azurerm_virtual_machine_storage_os_disk_caching
        managed_disk_type   = var.azurerm_virtual_machine_managed_os_disk_type
    }
    # OS Profile - LINUX
    dynamic "os_profile" {
        for_each = !var.azurerm_virtual_machine_is_windows_image ? [{content: true}] : []

        content {
            computer_name       = local.azurerm_vm_list_name[count.index]
            admin_username      = var.azurerm_virtual_machine_os_profile_admin_username
            admin_password      = var.azurerm_virtual_machine_os_profile_admin_password
            custom_data         = var.azurerm_virtual_machine_os_profile_custom_data
        }
    }
    # OS Profile Config - With SSH Key data - LINUX
    dynamic "os_profile_linux_config" {
        for_each = var.azurerm_virtual_machine_os_profile_linux_ssh_keys_key_data != "" && !var.azurerm_virtual_machine_is_windows_image ? [{content: true}] : []

        content {
            disable_password_authentication = var.disable_password_authentication_linux
            ssh_keys {
                key_data = var.azurerm_virtual_machine_os_profile_linux_ssh_keys_key_data
                path     = "/home/${var.azurerm_virtual_machine_os_profile_admin_username}/.ssh/authorized_keys"
            }
        }
    }
    # OS Profile Config - Without SSH Key data - LINUX
    dynamic "os_profile_linux_config" {
        for_each = var.azurerm_virtual_machine_os_profile_linux_ssh_keys_key_data == "" && !var.azurerm_virtual_machine_is_windows_image ? [{content: true}] : []

        content {
            disable_password_authentication = var.disable_password_authentication_linux
        }
    }
    # OS Profile - WINDOWS
    dynamic "os_profile" {
        for_each = var.azurerm_virtual_machine_is_windows_image ? [{content: true}] : []

        content {
            computer_name       = local.azurerm_vm_list_name[count.index]
            admin_username      = var.azurerm_virtual_machine_os_profile_admin_username
            admin_password      = var.azurerm_virtual_machine_os_profile_admin_password
        }
    }
    # OS Profile Config - WINDOWS
    dynamic "os_profile_windows_config" {
        for_each = var.azurerm_virtual_machine_is_windows_image ? [{content: true}] : []

        content {
            provision_vm_agent        = var.azurerm_virtual_machine_os_profile_windows_provision_vm_agent
            enable_automatic_upgrades = var.azurerm_virtual_machine_os_profile_windows_enable_automatic_upgrades
            timezone                  = var.azurerm_virtual_machine_os_profile_windows_timezone
        }
    }
}
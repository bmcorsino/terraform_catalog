provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

resource "azurerm_linux_virtual_machine" "main" {
    count                            = var.azurerm_virtual_machine_count
    name                             = local.azurerm_vm_list_name[count.index]
    location                         = var.azurerm_virtual_machine_location
    resource_group_name              = var.azurerm_virtual_machine_resource_group_name
    availability_set_id              = var.azurerm_virtual_machine_availability_set_id
    size                             = var.azurerm_virtual_machine_size
    admin_username                   = "adminuser"
    network_interface_ids            = [var.azurerm_virtual_machine_network_interface_ids[count.index]]
    tags 							 = var.azurerm_virtual_machine_tags
    license_type                     = null

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    # With Marketplace Image reference
    dynamic "source_image_reference" {
        for_each = var.azurerm_virtual_machine_os_custom_image_id == null ? [{content: true}] : []

        content {
            publisher       = var.azurerm_virtual_machine_os_publisher
            offer           = var.azurerm_virtual_machine_os_offer
            sku             = var.azurerm_virtual_machine_os_sku
            version         = var.azurerm_virtual_machine_os_version
        }
    }
    # With Custom Image reference
    dynamic "source_image_reference" {
        for_each = var.azurerm_virtual_machine_os_custom_image_id != null ? [{content: true}] : []

        content {
            id = var.azurerm_virtual_machine_os_custom_image_id
        }
    }
    
}
provider "azurerm" {
  features {}
}

resource "azurerm_windows_virtual_machine_scale_set" "main" {
  name                = var.azurerm_windows_vm_scale_name
  resource_group_name = var.azurerm_resource_group_name
  location            = var.azurerm_windows_vm_scale_location
  sku                 = var.azurerm_windows_virtual_machine_scale_set_sku
  instances           = var.azurerm_windows_virtual_machine_scale_set_instances
  admin_password      = var.azurerm_windows_virtual_machine_scale_set_admin_password
  admin_username      = var.azurerm_windows_virtual_machine_scale_set_admin_username

  source_image_reference {
    publisher = var.azurerm_windows_virtual_machine_scale_set_source_image_reference_publisher
    offer     = var.azurerm_windows_virtual_machine_scale_set_source_image_reference_offer
    sku       = var.azurerm_windows_virtual_machine_scale_set_source_image_reference_sku
    version   = var.azurerm_windows_virtual_machine_scale_set_source_image_reference_version
  }

  os_disk {
    storage_account_type = var.azurerm_windows_virtual_machine_scale_set_os_disk_sa_type
    caching              = var.azurerm_windows_virtual_machine_scale_set_os_disk_caching
  }

  network_interface {
    name    = var.azurerm_network_interface_name
    primary = true

    ip_configuration {
      name      = var.azurerm_ipconfig_name
      primary   = true
      subnet_id = azurerm_subnet.rctf_internal01.id
    }
  }
}
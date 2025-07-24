resource "azurerm_virtual_machine_extension" "additional_session_host_vdw" {
    count                       = var.azurerm_virtual_machine_extension_count
    name                        = "${var.azurerm_virtual_machine_extension_appname}${count.index + local.autoincrement < 10 ? "0" : ""}${count.index + local.autoincrement}-wvd-dsc-extension"
    virtual_machine_id          = var.azurerm_virtual_machine_extension_virtual_machine_id[count.index]
    publisher                   = "Microsoft.Powershell"
    type                        = "DSC"
    type_handler_version        = "2.73"
    auto_upgrade_minor_version  = true
    depends_on                  = [var.azurerm_resource_depends_on]
    tags                        = var.azurerm_virtual_machine_extension_tags

    settings = <<SETTINGS
{
    "modulesURL": "${var.azurerm_virtual_machine_extension_url_dsc_file_configuration}",
    "configurationFunction": "Configuration.ps1\\AddSessionHost",
     "properties": {
        "HostPoolName":"${var.azurerm_virtual_machine_extension_vdw_host_pool_name}",
        "registrationInfoToken": "${var.azurerm_virtual_machine_extension_vdw_host_pool_token}"
  }
}
SETTINGS
}
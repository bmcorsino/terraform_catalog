locals {
  settings_windows = {
    script   = compact(concat([var.command], split("\n", var.script)))
    fileUris = var.file_uris
  }
}

resource "azurerm_virtual_machine_extension" "domainjoin" {
    count                       = var.azurerm_virtual_machine_extension_count
    name                        = "${var.azurerm_virtual_machine_extension_appname}${count.index + local.autoincrement < 10 ? "0" : ""}${count.index + local.autoincrement}-domainjoin-extension"
    virtual_machine_id          = var.azurerm_virtual_machine_extension_virtual_machine_id[count.index]

    publisher                   = "Microsoft.Compute"
    type                        = "JsonADDomainExtension"
    type_handler_version        = "1.3"
    # What the settings mean: https://docs.microsoft.com/en-us/windows/desktop/api/lmjoin/nf-lmjoin-netjoindomain
    settings = <<SETTINGS
    {
    "Name": "${var.azurerm_virtual_machine_extension_domain}",
    "OUPath": "${var.azurerm_virtual_machine_extension_ou_path}",
    "User": "${var.azurerm_virtual_machine_extension_domain_user}@${var.azurerm_virtual_machine_extension_domain}",
    "Restart": "true",
    "Options": "3"
    }
    SETTINGS
    protected_settings = <<PROTECTED_SETTINGS
    {
    "Password": "${var.azurerm_virtual_machine_extension_password}"
    }
    PROTECTED_SETTINGS

    tags = var.azurerm_virtual_machine_extension_tags
    depends_on = [var.azurerm_resource_depends_on]
}
    
resource "azurerm_virtual_machine_extension" "windows" {
  count                       = var.azurerm_virtual_machine_extension_count
  name                        = "${var.azurerm_virtual_machine_extension_appname}${count.index + local.autoincrement < 10 ? "0" : ""}${count.index + local.autoincrement}-run-extension"
  virtual_machine_id          = var.azurerm_virtual_machine_extension_virtual_machine_id[count.index]
  publisher                   = "Microsoft.CPlat.Core"
  type                        = "RunCommandWindows"
  type_handler_version        = "1.1"
  auto_upgrade_minor_version  = true
  settings                    = jsonencode(local.settings_windows)
  tags                        = var.azurerm_virtual_machine_extension_tags

  depends_on = [azurerm_virtual_machine_extension.domainjoin]
}
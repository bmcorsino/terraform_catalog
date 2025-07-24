data "azurerm_key_vault" "keyvault" {
  name                = var.azurerm_key_vault_name
  resource_group_name = var.azurerm_resource_group_name

  depends_on = [var.azurerm_resource_depends_on]
}

resource "azurerm_key_vault_secret" "main" {
    count         = var.has_lifecycle == false ? 1 : 0

    name          = var.name             // nome do recurso
    content_type  = var.content_type     // usuário
    value         = var.value            // senha
    key_vault_id  = data.azurerm_key_vault.keyvault.id
    depends_on    = [data.azurerm_key_vault.keyvault]
    tags          = var.tags
    timeouts {
        read   = "30m"
    }
}

resource "azurerm_key_vault_secret" "main_lifecycle" {
    count         = var.has_lifecycle == true ? 1 : 0

    name          = var.name             // nome do recurso
    content_type  = var.content_type     // usuário
    value         = var.value            // senha
    key_vault_id  = data.azurerm_key_vault.keyvault.id
    depends_on    = [data.azurerm_key_vault.keyvault]
    tags          = var.tags

    lifecycle {
      ignore_changes = [
        value,
        key_vault_id
      ]
    }
    timeouts {
        read   = "30m"
    }
}
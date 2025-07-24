resource "time_rotating" "wvd_token" {
  count         = tonumber(var.token_expiration_date_in_days) > 0 ? 1 : 0
  rotation_days = tonumber(var.token_expiration_date_in_days) > 30 ? 30 : tonumber(var.token_expiration_date_in_days)
}

resource "azurerm_virtual_desktop_host_pool" "main" {
  location                 = var.location
  resource_group_name      = var.resource_group_name
  name                     = var.name
  friendly_name            = var.friendly_name
  validate_environment     = var.validate_environment
  start_vm_on_connect      = var.start_vm_on_connect
  custom_rdp_properties    = var.custom_rdp_properties
  type                     = var.type
  maximum_sessions_allowed = var.maximum_sessions_allowed
  load_balancer_type       = var.load_balancer_type
  preferred_app_group_type = var.preferred_app_group_type
  tags                     = var.tags

  dynamic "registration_info" {
      for_each = tonumber(var.token_expiration_date_in_days) > 0 ? [{content: true}] : []

      content {
          expiration_date = time_rotating.wvd_token[0].rotation_rfc3339
      }
  }
}
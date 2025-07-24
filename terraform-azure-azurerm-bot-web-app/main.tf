resource "azurerm_bot_web_app" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  #kind                = "webapp"
  microsoft_app_id    = var.microsoft_app_id
  # Luis
  luis_app_ids        = var.luis_app_ids
  luis_key            = var.luis_key
  # App Insights
  developer_app_insights_key = var.app_insights_key
  developer_app_insights_api_key = var.app_insights_api_key
  developer_app_insights_application_id = var.app_insights_application_id
  endpoint            = var.endpoint
  tags                = var.tags
}
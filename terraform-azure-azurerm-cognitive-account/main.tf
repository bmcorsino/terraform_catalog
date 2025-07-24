resource "azurerm_cognitive_account" "main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.kind
  sku_name            = var.sku_name
  tags                = var.tags
  qna_runtime_endpoint= var.qna_runtime_endpoint
}
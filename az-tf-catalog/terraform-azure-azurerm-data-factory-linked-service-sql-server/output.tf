output "azurerm_data_factory_pipeline_name" {
  description = "Azure Data Factory Pipeline name"
  value       = "${azurerm_data_factory_pipeline.main.name}"
}
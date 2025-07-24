resource "azurerm_data_factory_linked_service_sql_server" "main" {
  name                = "${var.azurerm_data_factory_linked_service_sql_server}"
  resource_group_name = "${var.azurerm_data_factory_linked_service_sql_server_resource_group_name}"
  data_factory_name   = "${var.azurerm_data_factory_name}"
  connection_string   = "${var.azurerm_connection_string}"
 
}



resource "azurerm_data_factory_pipeline" "main" {
  name                = "${var.azurerm_data_factory_pipeline_name}"
  resource_group_name = "${var.azurerm_data_factory_pipeline_resource_group_name}"
  data_factory_name   = "${var.azurerm_data_factory_name}"

  /*threat_detection_policy ={
    state ="Enabled"
    storage_endpoint="${var.azurerm_data_factory_td_storage_account_endpoint}"
    storage_account_access_key="${var.azurerm_data_factory_td_storage_account_key}"
    retention_days ="1825"
    email_addresses ="security@edp.com"
  }*/
  
}



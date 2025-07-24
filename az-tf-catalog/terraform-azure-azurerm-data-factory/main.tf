resource "azurerm_data_factory" "main" {
  name                = "${var.azurerm_data_factory_name}"
  resource_group_name = "${var.azurerm_data_factory_resource_group_name}"
  location            = "${var.azurerm_data_factory_location}"

  /*threat_detection_policy ={
    state ="Enabled"
    storage_endpoint="${var.azurerm_data_factory_td_storage_account_endpoint}"
    storage_account_access_key="${var.azurerm_data_factory_td_storage_account_key}"
    retention_days ="1825"
    email_addresses ="security@kpmg.com"
  }*/
  
}



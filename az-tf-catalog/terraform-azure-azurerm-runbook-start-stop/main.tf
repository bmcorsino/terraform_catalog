resource "azurerm_automation_runbook" "main" {
    count                   = "${var.azurerm_runbook_exists == true ? 0 : 1}"
    name                    = "${var.azurerm_azurerm_runbook_name}"
    location                = "${var.azurerm_runbook_location}"
    resource_group_name     = "${var.azurerm_resource_group_name}"
    automation_account_name = "${var.azurerm_automation_account_name}"
    log_verbose             = "${var.azurerm_azurerm_runbook_log_verbose}"
    log_progress            = "${var.azurerm_azurerm_runbook_log_progress}"
    description             = "${var.azurerm_azurerm_runbook_description}"
    runbook_type            = "${var.azurerm_azurerm_runbook_type}"
    tags                    = "${var.azurerm_azurerm_runbook_tags}"

    publish_content_link {
        uri = "${var.azurerm_azurerm_runbook_publish_content_link}"
    }

    content                 = "${file("${path.module}/runbook/template.ps1")}"
}
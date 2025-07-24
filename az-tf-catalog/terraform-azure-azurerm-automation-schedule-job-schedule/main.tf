resource "azurerm_automation_schedule" "schedule" {
    for_each                = "${local.azurerm_schedule_job_map}"

    name                    = "${each.value.name}"
    frequency               = "${each.value.frequency}"
    interval                = "${each.value.interval}"
    timezone                = "${each.value.timezone}"
    start_time              = "${each.value.start_time}"
    expiry_time             = "${each.value.expiry_time != "" ? each.value.expiry_time : null}"
    week_days               = "${each.value.frequency == "Week" ? split(",", "${each.value.week_days}") : null}"
    month_days              = "${each.value.frequency == "Month" ? split(",", "${each.value.month_days}") : null}"

    // Default
    description             = "${var.azurerm_automation_schedule_description}"
    resource_group_name     = "${var.azurerm_resource_group_name}"
    automation_account_name = "${var.azurerm_automation_account_name}"
}

resource "azurerm_automation_job_schedule" "job_schedule" {
    for_each                = "${local.azurerm_schedule_job_map}"

    # schedule_name           = azurerm_automation_schedule.schedule[each.key].name
    parameters              = "${each.value.parameters != "" ? jsondecode(each.value.parameters) : null}"

    // Default
    schedule_name           = "${each.value.name}"
    runbook_name            = "${var.azurerm_automation_account_runbook_name}"
    resource_group_name     = "${var.azurerm_resource_group_name}"
    automation_account_name = "${var.azurerm_automation_account_name}"
}
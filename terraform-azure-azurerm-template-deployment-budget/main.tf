data "template_file" "main" {
  for_each            = local.azurerm_template_deployment_budget_merged_map
  template            = "${file("${path.module}/templates/AzureBudget.json")}"
}
/*
template  - (Required) The contents of the template, as a string using Terraform template syntax. Use the file function to load the template source from a separate file on disk.
vars      - (Optional) Variables for interpolation within the template. Note that variables must all be primitives. Direct references to lists or maps will cause a validation error.
*/

resource "azurerm_template_deployment" "main" {
  for_each            = local.azurerm_template_deployment_budget_merged_map

  name                = "${local.azurerm_template_deployment_budget_resource_group_tags_map[ each.value.resource_group_name ].alias}-${local.azurerm_template_deployment_budget_resource_group_tags_map[ each.value.resource_group_name ].environment}-${each.value.template_deployment_budget_name_suffix}"
  resource_group_name = each.value.resource_group_name

  template_body       = data.template_file.main[each.key].rendered
  parameters_body  = <<EOF
  {
    "budgetName": {
      "value": "${local.azurerm_template_deployment_budget_resource_group_tags_map[ each.value.resource_group_name ].alias}-${local.azurerm_template_deployment_budget_resource_group_tags_map[ each.value.resource_group_name ].environment}-${each.value.template_deployment_budget_name_suffix}"
    },
    "amount": {
      "value": "${lookup(each.value, "parameters_amount", 500)}"
    },
    "budgetCategory": {
      "value": "${lookup(each.value, "parameters_budgetCategory", "Cost")}"
    },
    "timeGrain": {
      "value": "${lookup(each.value, "parameters_timeGrain", "Monthly")}"
    },
    "startDate": {
      "value": "${lookup(each.value, "parameters_startDate", "${formatdate("YYYY-MM", timestamp())}-01")}"
    },
    "operator": {
      "value": "${lookup(each.value, "parameters_operator", "GreaterThanOrEqualTo")}"
    },
    "threshold": {
      "value": "${lookup(each.value, "parameters_threshold", 75)}"
    },
    "contactEmails": {
      "value": "${lookup(each.value, "parameters_contactEmails", "abc@edp.pt")}"
    },
    "contactGroups": {
      "value": ["${lookup(each.value, "parameters_contactGroups", "/subscriptions/e0c332c0-0db1-41ca-8455-27bb848a48c9/resourceGroups/azurebackuprg_westeurope_1/providers/microsoft.insights/actionGroups/budget-ag-01")}"]
    }
  }
  EOF
  deployment_mode = lookup(each.value, "deployment_mode", "incremental")

  // depends on rg
  depends_on            = [var.azurerm_resource_depends_on]
}

/*
https://www.terraform.io/docs/providers/azurerm/r/template_deployment.html
name                - (Required) Specifies the name of the template deployment. Changing this forces a new resource to be created. 
resource_group_name - (Required) The name of the resource group in which to create the template deployment. 
deployment_mode     - (Required) Specifies the mode that is used to deploy resources. This value could be either Incremental or Complete. Note that you will almost always want this to be set to Incremental otherwise the deployment will destroy all infrastructure not specified within the template, and Terraform will not be aware of this. 
template_body       - (Optional) Specifies the JSON definition for the template. 
parameters          - (Optional) Specifies the name and value pairs that define the deployment parameters for the template.
parameters_body     - (Optional) Specifies a valid Azure JSON parameters file that define the deployment parameters. It can contain KeyVault references
*/


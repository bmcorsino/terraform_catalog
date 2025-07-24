/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "aws_fms_policy" "main" {
  name                  = var.aws_fms_policy_name
  exclude_resource_tags = var.exclude_resource_tags
  remediation_enabled   = var.remediation_enabled
  resource_type         = var.resource_type

  security_service_policy_data {
    type = var.policy_data_type

    managed_service_data = jsonencode({
      type = var.managed_service_data_type,
      ruleGroups = [{
        id = aws_wafregional_rule_group.main.id
        overrideAction = {
          type = var.overrideAction_type
        }
      }]
      defaultAction = {
        type = var.defaultAction_type
      }
      overrideCustomerWebACLAssociation = var.overrideCustomerWebACLAssociation
    })
  }
}

resource "aws_wafregional_rule_group" "main" {
  metric_name = var.waf_metric_name
  name        = var.waf_name
}
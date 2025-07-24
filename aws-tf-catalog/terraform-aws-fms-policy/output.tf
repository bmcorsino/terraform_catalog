output "main" {
  description = "The ID of the AWS FMS policy"
  value       = aws_fms_policy.main.id
}

output "aws_wafregional_rule_group_id" {
  description = "The ID of the AWS WAF regional rule group"
  value       = aws_wafregional_rule_group.main.id
}
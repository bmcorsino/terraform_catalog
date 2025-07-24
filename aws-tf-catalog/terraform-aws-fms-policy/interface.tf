variable "aws_fms_policy_name" {
  description = "Name of the AWS FMS policy"
}

variable "exclude_resource_tags" {
  description = "List of tags that should be excluded from the AWS FMS policy"
}

variable "remediation_enabled" {
  description = "Whether remediation is enabled for the AWS FMS policy"
  default     = false
}

variable "resource_type" {
  description = "The type of resource that the AWS FMS policy should apply to"
}

variable "policy_data_type" {
  description = "The type of policy data for the AWS FMS policy"
}

variable "managed_service_data_type" {
  description = "The type of managed service data for the AWS FMS policy"
}

variable "overrideAction_type" {
  description = "The type of override action for the AWS FMS policy"
}

variable "defaultAction_type" {
  description = "The type of default action for the AWS FMS policy"
}

variable "overrideCustomerWebACLAssociation" {
  description = "Whether to override the customer's web ACL association for the AWS FMS policy"
}

variable "waf_metric_name" {
  description = "The metric name for the AWS WAF regional rule group"
}

variable "waf_name" {
  description = "The name of the AWS WAF regional rule group"
}
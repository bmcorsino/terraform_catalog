FMS policy resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [FMS Policy](#fms)
- [Output](#output)

## FMS policy `<a name="fms"></a>`

```bash
module "aws_fms_policy" {
    source = "git::https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/terraform-aws-fms-policy"

  aws_fms_policy_name                = ""
  exclude_resource_tags              = false
  remediation_enabled                = false
  resource_type                      = ""
  policy_data_type                   = ""
  managed_service_data_type          = ""
  overrideAction_type                = ""
  defaultAction_type                 = ""
  overrideCustomerWebACLAssociation  = false
## WAF Rule Group
  waf_metric_name  		     = ""
  waf_name    			     = ""
}
```

## Output `<a name="output"></a>`

```bash
output "main" {
value = module.aws_fms_policy.main
}

output "main" {
value = module.aws_fms_policy.aws_wafregional_rule_group_id
}
```

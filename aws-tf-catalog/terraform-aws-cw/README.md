# DXC Cloudwatch Alarm

Provides a CloudWatch Metric Alarm resource.


## Any questions or suggestion?

Raise issues for asking help

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Cloudwatch Alarm](#cloudwatch-alarm)
- [Observations](#observations)

## Cloudwatch Alarm <a name="cloudwatch-alarm"></a>
```bash
module "aws_cloudwatch_alarm" {
  source                    = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-cw"
  alarm_name                = "terraform-test-main5"
  comparison_operator       = "GreaterThanOrEqualToThreshold"    # Example: GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold...
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"     # Example: AWS/RDS,AWS/EC2,AWS/CertificateManager...
  period                    = "120"
  statistic                 = "Average"     # Example: SampleCount, Average, Sum, Minimum, Maximum
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}
```
## Observations <a name="observations"></a>
```hcl
metric_name = The name for the alarm's associated metric.  See docs for supported metrics: https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html

namespace = The namespace for the alarm's associated metric. See docs for the list of namespaces: https://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/aws-namespaces.html
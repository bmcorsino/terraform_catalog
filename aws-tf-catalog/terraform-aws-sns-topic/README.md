# AWS SNS Topic 

Provides an SNS topic resource

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [SNS Topic](#sns_topic)

## SNS Topic <a name="sns_topic"></a>
```bash

module "sns_topic" {
  source                                  = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-sns-topic"
  name                                    = "user-updates-topic"
}

```
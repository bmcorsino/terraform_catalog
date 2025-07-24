# AWS SNS Topic Subscription

Provides a resource for subscribing to SNS topics. Requires that an SNS topic exist for the subscription to attach to.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [SNS Topic Subscription](#sns_topic_sub)
- [Observations](#observations)

## SNS Topic Subscription <a name="sns_topic_sub"></a>
```bash

module "sns_topic_subscription" {
  source    = "https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-sns-topic-subscription"
  topic_arn = "arn:aws:sns:us-west-2:432981146916:user-updates-topic" # ARN of the SNS topic to subscribe to.
  protocol  = "email"                                                 
  endpoint  = "example@hotmail.com"  #  Endpoint to send data to. The contents vary with the protocol. 
}

```

## Observations <a name="observations"></a>

- **protocol :**  Protocol to use. Valid values are: sqs, sms, lambda, firehose, and application. Protocols email, email-json, http and https are also valid but partially supported.
- **partially supported :**  If an aws_sns_topic_subscription uses a partially-supported protocol and the subscription is not confirmed, either through automatic confirmation or means outside of Terraform, Terraform cannot delete / unsubscribe the subscription. Attempting to destroy an unconfirmed subscription will remove the aws_sns_topic_subscription from Terraform's state but will not remove the subscription from AWS.
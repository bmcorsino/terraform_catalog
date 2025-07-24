# AWS SQS Queue

Provides an SQS Queue

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [SQS Queue](#sqs_queue)
- [Observations](#observations)

## SQS Queue <a name="sqs_queue"></a>
```bash

module "sqs_queue" {
  source    = "https://github.dxc.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-sqs-queue"
  name                      = ""   
  delay_seconds             = ""     # The time in seconds that the delivery of all messages in the queue will be delayed.
  max_message_size          = ""     # The limit of how many bytes a message can contain before Amazon SQS rejects it
  message_retention_seconds = ""     # The number of seconds Amazon SQS retains a message
  receive_wait_time_seconds = ""     # The time for which a ReceiveMessage call will wait for a message to arrive before returning.
}

```

## Observations <a name="observations"></a>

- **name :**  Queue names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 80 characters long.
- **delay_seconds :**  An integer from 0 to 900 (15 minutes). The default for this attribute is 0 seconds.
- **max_message_size :** An integer from 1024 bytes (1 KiB) up to 262144 bytes (256 KiB). The default for this attribute is 262144 (256 KiB).
- **message_retetion_seconds :**  Integer representing seconds, from 60 (1 minute) to 1209600 (14 days). The default for this attribute is 345600 (4 days).
- **receive_wait_time_seconds :** An integer from 0 to 20 (seconds). The default for this attribute is 0, meaning that the call will return immediately.
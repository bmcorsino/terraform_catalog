/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = var.topic
  protocol  = var.protocol
  endpoint  = var.endpoint
}
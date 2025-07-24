/*************************************************************
*             Author:   kpmg  Portugal                     *
*************************************************************/

resource "aws_sqs_queue" "main" {
  name                      = var.sqs_name
  delay_seconds             = var.delay_seconds
  max_message_size          = var.max_message_size
  message_retention_seconds = var.message_retetion_seconds
  receive_wait_time_seconds = var.wai_time_seconds
}
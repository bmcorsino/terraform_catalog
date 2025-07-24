variable "sqs_name" {
  description = "The name of the queue."
  type = string
}

variable "delay_seconds" {
  description = " The time in seconds that the delivery of all messages in the queue will be delayed."
  type = number
}

variable "max_message_size" {
  description = " The limit of how many bytes a message can contain before Amazon SQS rejects it."
  type = number
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message."
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive before returning."
  type = number
}
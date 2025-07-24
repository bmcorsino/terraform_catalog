variable "topic" {
  description = " ARN of the SNS topic to subscribe to."
  type = string
}

variable "protocol" {
  description = "Protocol to use."
  type = string
}

variable "endpoint" {
  description = "Endpoint to send data to."
  type = string
}
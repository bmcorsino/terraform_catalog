variable "function_name" {
  type = string
}

variable "role" {
  type        = string
  description = "Amazon Resource Name (ARN) of the function's execution role"
}

variable "package_type" {
  type        = string
  description = "Lambda deployment package type. Valid values are Zip and Image"
  default     = "Zip"
}

variable "runtime" {
  type        = string
  description = "Function runtime"
}

variable "handler" {
  type        = string
  description = "Function entrypoint in your code."
}

variable "s3_bucket" {
  type        = string
  description = "S3 bucket location"
}

variable "s3_key" {
  type = string
}

variable "memory_size" {
  type        = number
  description = "Amount of memory in MB your Lambda Function can use at runtime"
}

variable "timeout" {
  type        = number
  description = "Amount of time your Lambda Function has to run in seconds"
  default     = 3
}

variable "variables" {
  description = "Variables for your lambda function"
  default     = {}
}
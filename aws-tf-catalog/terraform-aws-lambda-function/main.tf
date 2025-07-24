/*************************************************************
*             Author:   DXC IDD Portugal                     *
*************************************************************/

resource "aws_lambda_function" "main" {
  function_name = var.function_name
  role          = var.role
  package_type  = var.package_type
  runtime       = var.runtime
  handler       = var.handler
  s3_bucket     = var.s3_bucket
  s3_key        = var.s3_key
  memory_size   = var.memory_size
  timeout       = var.timeout

  environment {
    variables = var.variables
  }
}
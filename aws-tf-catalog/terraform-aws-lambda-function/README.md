FMS policy resource.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [Lambda Funtion](#lmb)
- [Output](#output)

## Lambda Function `<a name="lmb"></a>`

```bash
module "aws_lambda_function" {
    source = "git::https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/terraform-aws-lambda-function"

  function_name 	= ""
  role 			= ""
  package_type 		= "Zip"
  runtime 		= "python3.9"
  handler 		= ""
  s3_bucket 		= ""
  s3_key 		= ""
  memory_size 		= 128
  timeout 		= 3
  variables 		= {foo = "bar", bar = "foo"}
}
```

## Output `<a name="output"></a>`

```bash
output "aws_lambda" {
  value = module.aws_lambda_function.main
}
```

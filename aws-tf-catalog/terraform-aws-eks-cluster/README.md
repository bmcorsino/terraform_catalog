# EKS Cluster

Manages an EKS Cluster.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [EKS Cluster](#eks_cluster)

## EKS Cluster <a name="eks_cluster"></a>
```bash
module "aws_eks_cluster" {
  source                    = "https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-eks-cluster"
  name                      = "example_name"
  role_arn                  = ""  # ARN for the role
  version                   = ""  
  security_group_ids        = ""  
  endpoint_private_access   = ""  # true or false
  subnet_ids                = ""  
}
```
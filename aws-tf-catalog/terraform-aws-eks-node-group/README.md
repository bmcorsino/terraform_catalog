# EKS Node Group

Manages an EKS Node Group.

## Any questions or suggestion?

Raise issues for asking help.

## Run terraform

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

## Index

- [EKS Node Group](#eks_node_group)
- [Extra Fields](#extra_fields)

## EKS Node Group <a name="eks_node_group"></a>
```bash
module "aws_eks_node_group" {
  source          = "https://github.kpmg.com/PT-CloudOps-Team/aws-tf-catalog/tree/main/terraform-aws-eks-node-group"
  cluster_name    = "example-cluster-test"  # The name of the eks cluster to use the node group
  node_group_name = "example"
  node_role_arn   = ""
  subnet_ids      = ""

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
}
```

## Extra Fields<a name="extra_fields"></a>

```bash
  
  instance_types    = ""   # Default ["t3.medium"]
  disk_size         = ""   # Defaults to 50 for Windows, 20 all other node groups
  
```
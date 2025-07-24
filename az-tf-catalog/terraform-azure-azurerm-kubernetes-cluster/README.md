# terraform-azurerm-kubernetes-cluster

Official terraform documentation: https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html

# ATTENTION
There's an identified issue were the add or removal of agentpools via terraform forces the cluster to recreate
It's recommended to ask the system admin to create the agentpool manually and then specify it in terraform.

The issue can be followed here:
https://github.com/terraform-providers/terraform-provider-azurerm/issues/3971


# Usage
We recommend to never call this module with sensitive information explicit on the main file. Instead, it's a better approach to pass it as a variable like:

```
terraform plan -var "azurerm_kubernetes_cluster_service_principal_client_secret=secret"
```

## Create a new kubernetes cluster

This Terraform module deploys a simple k8s cluster. New versions will provide more features.

## Usage example

# Simple Cluster without network parameters

```hcl
module "cluster-01" {
  source                                                        = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/icaterraform-azure-azurerm-kubernetes-cluster.git"
  azurerm_kubernetes_cluster_name                               = "cluster-name"
  azurerm_kubernetes_cluster_location                           = "West Europe"
  azurerm_kubernetes_cluster_resource_group_name                = "devops-dev-rg-01"
  azurerm_kubernetes_cluster_dns_prefix                         = "devops-dev-aks-01"
  azurerm_kubernetes_cluster_service_principal_client_id        = "xxxx-xxxxx"
  azurerm_kubernetes_cluster_service_principal_client_secret    = "${var.devops_cluster_service_principal_secret}"
  azurerm_kubernetes_cluster_linux_admin_username               = "devops"
  azurerm_kubernetes_cluster_linux_admin_ssh_key                = "${var.devops_cluster_admin_ssh_key}"
  azurerm_kubernetes_cluster_tags = {
    source = "terraform"
  }

  agent_pools = [
    {
      name            = "agentpool01"
      count           = "3"
      vm_size         = "Standard_DS1_v2"
      os_type         = "Linux"
      os_disk_size_gb = "30"
      type            = "VirtualMachineScaleSets"
      vnet_subnet_id  = "vnet-id"
    },
    {
      name            = "agentpool02"
      count           = "1"
      vm_size         = "Standard_B2ms"
      os_type         = "Linux"
      os_disk_size_gb = "100"
      type            = "VirtualMachineScaleSets"
      vnet_subnet_id  = "vnet-id"
    }
  ]
}
```

# Simple with network parameters

```hcl
module "cluster-01" {
  source                                                        = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/icaterraform-azure-azurerm-kubernetes-cluster.git"
  azurerm_kubernetes_cluster_name                               = "cluster-name"
  azurerm_kubernetes_cluster_location                           = "West Europe"
  azurerm_kubernetes_cluster_resource_group_name                = "devops-dev-rg-01"
  azurerm_kubernetes_cluster_dns_prefix                         = "devops-dev-aks-01"
  azurerm_kubernetes_cluster_service_principal_client_id        = "xxxx-xxxxx"
  azurerm_kubernetes_cluster_service_principal_client_secret    = "${var.devops_cluster_service_principal_secret}"
  azurerm_kubernetes_cluster_linux_admin_username               = "devops"
  azurerm_kubernetes_cluster_linux_admin_ssh_key                = "${var.devops_cluster_admin_ssh_key}"
  azurerm_kubernetes_cluster_network_profile_network_plugin     = "kubenet"
  azurerm_kubernetes_cluster_network_profile_network_policy     = "calico"
  azurerm_kubernetes_cluster_network_profile_dns_service_ip     = "10.0.0.1"
  azurerm_kubernetes_cluster_network_profile_docker_bridge_cidr = "127.0.0.0/16"
  azurerm_kubernetes_cluster_network_profile_pod_cidr           = "127.0.0.0/16"
  azurerm_kubernetes_cluster_network_profile_service_cidr       = "127.0.0.0/16"
  azurerm_kubernetes_cluster_tags = {
    source = "terraform"
  }
  azurerm_kubernetes_cluster_load_balancer_sku                  = ""  // Basic or Standard

  agent_pools = [
    {
      name            = "agentpool01"
      count           = "3"
      vm_size         = "Standard_DS1_v2"
      os_type         = "Linux"
      os_disk_size_gb = "30"
      type            = "VirtualMachineScaleSets"
      vnet_subnet_id  = "vnet-id"
    },
    {
      name            = "agentpool02"
      count           = "1"
      vm_size         = "Standard_B2ms"
      os_type         = "Linux"
      os_disk_size_gb = "100"
      type            = "VirtualMachineScaleSets"
      vnet_subnet_id  = "vnet-id"
    }
  ]
}
```

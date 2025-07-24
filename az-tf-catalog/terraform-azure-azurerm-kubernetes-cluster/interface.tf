variable "azurerm_kubernetes_cluster_name" {
  description = "The name of the Managed Kubernetes Cluster to create"
}

variable "azurerm_kubernetes_cluster_location" {
  description = "The location where the Managed Kubernetes Cluster should be created"
}

variable "azurerm_kubernetes_cluster_resource_group_name" {
  description = "The Resource Group where the Managed Kubernetes Cluster should exist"
}

variable "azurerm_kubernetes_cluster_tenant_id" {
  description = "The Tenant ID where the Managed Kubernetes Cluster should exist"
  default     = null
}

variable "azurerm_kubernetes_cluster_dns_prefix" {
  description = "The DNS prefix specified when creating the managed cluster"
}

variable "azurerm_kubernetes_cluster_vnet_rule_subnet_id" {
  description = "The ID of a Subnet where the Kubernetes Node Pool should exist"
}

variable "azurerm_kubernetes_cluster_kubernetes_version" {
  description = "The version of Kubernetes specified when creating the AKS managed cluster"
}

variable "azurerm_kubernetes_cluster_rbac_enabled" {
  description = "Is Role Based Access Control Enabled?"
  default     = true
  type        = bool
}

variable "azurerm_kubernetes_cluster_rbac_ad_server_app_id" {
  description = "The Server ID of an Azure Active Directory Application"
  default     = null
}

variable "azurerm_kubernetes_cluster_rbac_ad_server_app_secret" {
  description = "The Server Secret of an Azure Active Directory Application"
  default     = null
}

variable "azurerm_kubernetes_cluster_admin_group_object_ids" {
  description  = "List of Object IDs of Azure Active Directory Groups which should have Admin Roles on the cluster"
  default      = null
}

variable "azurerm_kubernetes_cluster_network_profile_network_plugin" {
  description = "Network plugin to use for networking. Currently supported values are azure and kubenet"
  default     = "kubenet"
}

variable "azurerm_kubernetes_cluster_network_profile_network_policy" {
  description = "Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure"
  default     = null
}

variable "azurerm_kubernetes_cluster_network_profile_dns_service_ip" {
  description = "IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns)"
  default     = null
}

variable "azurerm_kubernetes_cluster_network_profile_docker_bridge_cidr" {
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes"
  default     = null
}

variable "azurerm_kubernetes_cluster_network_profile_pod_cidr" {
  description = "The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet"
  default     = null
}

variable "azurerm_kubernetes_cluster_network_profile_service_cidr" {
  description = "The Network Range used by the Kubernetes service"
  default     = null
}

variable "azurerm_kubernetes_cluster_load_balancer_sku" {
  description = "The Load Balancer Tier"
  default       = "Basic"
}

variable "azurerm_kubernetes_cluster_oms_agent_enabled" {
  description = "Is the OMS Agent Enabled on the cluster?"
  default     = false
}

variable "azurerm_kubernetes_cluster_oms_agent_log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace which the OMS Agent should send data to."
  default     = null
}

variable "azurerm_kubernetes_cluster_active_directory_managed" {
  description = "Is the Azure Active Directory integration Managed, meaning that Azure will create/manage the Service Principal used for integration"
  default     = false
}

variable "azurerm_kubernetes_cluster_service_principal_client_id" {
  description = "The Client ID for the Service Principal"
  default     = null
}

variable "azurerm_kubernetes_cluster_service_principal_client_secret" {
  description = "The Client Secret for the Service Principal"
  default     = null
}

variable "azurerm_kubernetes_cluster_linux_admin_username" {
  description = "The Admin Username for the Cluster"
  default     = null
}

variable "azurerm_kubernetes_cluster_linux_admin_ssh_key" {
  description = "The Admin SSH Key for the Cluster"
  default     = null
}

variable "azurerm_kubernetes_cluster_windows_admin_username" {
  description = "The Admin Username for Windows VMs"
  default       = null
}

variable "azurerm_kubernetes_cluster_windows_password" {
  description = "The Admin Password for Windows VMs"
  default       = null
}

variable "azurerm_kubernetes_cluster_tags" {
  description = "Azure kubernetes cluster tags"
  default = {
    Environment = null
  }
}

variable "azurerm_kubernetes_cluster_default_node_pool" {
  description = "Default node pool block configuration"
  default     = null
  type        = object({
    enable_auto_scaling = bool
    name                = string
    min_count           = number
    max_count           = number
    node_count          = number
    os_disk_size_gb     = number
    type                = string
    vm_size             = string
  })
}

variable "azurerm_kubernetes_cluster_node_pools" {
  description = "Node pool block configuration"
  default     = {}
  type        = map(object({
    enable_auto_scaling = bool
    name                = string
    min_count           = number
    max_count           = number
    node_count          = number
    os_type             = string
    os_disk_size_gb     = number
    type                = string
    vm_size             = string
  }))
}

variable "azurerm_resource_depends_on" {
    default = [""]
}
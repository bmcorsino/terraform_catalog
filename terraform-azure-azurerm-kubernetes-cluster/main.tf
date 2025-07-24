resource "azurerm_kubernetes_cluster" "main" {
  name                       = var.azurerm_kubernetes_cluster_name
  location                   = var.azurerm_kubernetes_cluster_location
  resource_group_name        = var.azurerm_kubernetes_cluster_resource_group_name
  dns_prefix                 = var.azurerm_kubernetes_cluster_dns_prefix
  kubernetes_version         = var.azurerm_kubernetes_cluster_kubernetes_version
  default_node_pool {
    enable_auto_scaling = lookup(var.azurerm_kubernetes_cluster_default_node_pool, "enable_auto_scaling", false)
    min_count           = try(var.azurerm_kubernetes_cluster_default_node_pool.enable_auto_scaling, false) ? lookup(var.azurerm_kubernetes_cluster_default_node_pool, "min_count", 3) : null
    max_count           = try(var.azurerm_kubernetes_cluster_default_node_pool.enable_auto_scaling, false) ? lookup(var.azurerm_kubernetes_cluster_default_node_pool, "max_count", 3) : null
    name                = var.azurerm_kubernetes_cluster_default_node_pool.name
    node_count          = var.azurerm_kubernetes_cluster_default_node_pool.node_count
    os_disk_size_gb     = var.azurerm_kubernetes_cluster_default_node_pool.os_disk_size_gb
    type                = var.azurerm_kubernetes_cluster_default_node_pool.type
    vm_size             = var.azurerm_kubernetes_cluster_default_node_pool.vm_size
    orchestrator_version= var.azurerm_kubernetes_cluster_kubernetes_version
    # Required for advanced networking
    vnet_subnet_id      = var.azurerm_kubernetes_cluster_vnet_rule_subnet_id
  }
  network_profile {
    network_plugin      = var.azurerm_kubernetes_cluster_network_profile_network_plugin
    network_policy      = var.azurerm_kubernetes_cluster_network_profile_network_policy
    dns_service_ip      = var.azurerm_kubernetes_cluster_network_profile_dns_service_ip
    docker_bridge_cidr  = var.azurerm_kubernetes_cluster_network_profile_docker_bridge_cidr
    pod_cidr            = var.azurerm_kubernetes_cluster_network_profile_pod_cidr
    service_cidr        = var.azurerm_kubernetes_cluster_network_profile_service_cidr
    # Do not create Load Balancer with public IP
    load_balancer_sku   = !contains(["basic", "standard"], lower(var.azurerm_kubernetes_cluster_load_balancer_sku)) ? "Basic" : var.azurerm_kubernetes_cluster_load_balancer_sku
  }
  dynamic "azure_active_directory_role_based_access_control" {
      for_each = var.azurerm_kubernetes_cluster_rbac_enabled ? [{content: true}] : []
      content {
          managed                  = var.azurerm_kubernetes_cluster_active_directory_managed
          tenant_id                = var.azurerm_kubernetes_cluster_tenant_id
          admin_group_object_ids   = var.azurerm_kubernetes_cluster_admin_group_object_ids
          client_app_id            = var.azurerm_kubernetes_cluster_active_directory_managed ? null : var.azurerm_kubernetes_cluster_service_principal_client_id
          server_app_id            = var.azurerm_kubernetes_cluster_active_directory_managed ? null : var.azurerm_kubernetes_cluster_rbac_ad_server_app_id
          server_app_secret        = var.azurerm_kubernetes_cluster_active_directory_managed ? null : var.azurerm_kubernetes_cluster_rbac_ad_server_app_secret
      }
  }
  dynamic "oms_agent" {
      for_each = var.azurerm_kubernetes_cluster_oms_agent_enabled ? [{content: true}] : []
      content {
          log_analytics_workspace_id  = var.azurerm_kubernetes_cluster_oms_agent_log_analytics_workspace_id
      }
  }
  service_principal {
    client_id     = var.azurerm_kubernetes_cluster_service_principal_client_id
    client_secret = var.azurerm_kubernetes_cluster_service_principal_client_secret
  }
  linux_profile {
    admin_username = var.azurerm_kubernetes_cluster_linux_admin_username
    ssh_key {
      key_data = var.azurerm_kubernetes_cluster_linux_admin_ssh_key
    }
  }
  tags        = var.azurerm_kubernetes_cluster_tags
  depends_on  = [var.azurerm_resource_depends_on]
}
resource "azurerm_kubernetes_cluster_node_pool" "main" {
  for_each = var.azurerm_kubernetes_cluster_node_pools
  kubernetes_cluster_id = azurerm_kubernetes_cluster.main.id
  name                  = each.value.name
  node_count            = each.value.node_count
  vm_size               = each.value.vm_size
  max_pods              = 250
  os_type               = each.value.os_type
  os_disk_size_gb       = each.value.os_disk_size_gb
  enable_auto_scaling   = lookup(each.value, "enable_auto_scaling", false)
  min_count             = try(each.value.enable_auto_scaling, false) ? lookup(each.value, "min_count", 3) : null
  max_count             = try(each.value.enable_auto_scaling, false) ? lookup(each.value, "max_count", 3) : null
  # Required for advanced networking
  vnet_subnet_id        = var.azurerm_kubernetes_cluster_vnet_rule_subnet_id
  tags        = var.azurerm_kubernetes_cluster_tags
  depends_on  = [var.azurerm_resource_depends_on]
}
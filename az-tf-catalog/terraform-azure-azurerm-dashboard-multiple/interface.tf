variable "azurerm_dashboard_resources_array" {
  # type = list(map(string))
}
variable "azurerm_dashboard_path_from_module" {
  description = "Dashboard template file path bellow module."
}

locals {
  dashboard_map_4 = [
    for v in var.azurerm_dashboard_resources_array : 
      {for i, u in v : 
          i => u
            if 
              i != "boot_diagnostics" &&  
              i != "identity" &&
              i != "network_interface_ids" &&  
              i != "os_profile" &&
              i != "os_profile_linux_config" &&  
              i != "os_profile_secrets" &&
              i != "os_profile_windows_config" &&  
              i != "plan" &&
              i != "storage_data_disk" &&  
              i != "storage_image_reference" &&
              i != "storage_os_disk" &&  
              i != "additional_capabilities" && 
              i != "zones" &&
              i != "delete_data_disks_on_termination" &&
              i != "delete_os_disk_on_termination" &&
              i != "tags"  
      }
  ]
  dashboard_map_3 = {
      for k, v in local.dashboard_map_4 :
          k => merge(
              {index = "index"}, 
              {resource_group_name = split("/", v.id)[4]},
              v
          )
  }
  dashboard_map_2 = {
      for k, v in local.dashboard_map_3 : 
          (v.resource_group_name) => v ...
  }
  dashboard_map = {
      for k, v in local.dashboard_map_2 : 
          k => {
              for i, u in v : 
                  i => {
                      for j, x in u :
                          j => (j == "index" ? i : u[j])
                  }
          }
  }

  dashboard_tags_map_2 = {
      for k, v in var.azurerm_dashboard_resources_array : 
          (split("/", v.id)[4]) => v ...
  }
  dashboard_tags_map = {
      for k, v in local.dashboard_tags_map_2 : 
          k => {
              for i, u in v : 
                  i => u.tags
          }
  }
}

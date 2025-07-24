output "service_principal_data_output" {
  value = {
    for k, v in data.azuread_service_principal.main : 
        k => {
          for i, u in v : 
            i => u
              if
                i != "app_roles" &&
                i != "oauth2_permissions"
        }
  }
}

output "group_data_output" {
  value = {
    for k, v in data.azuread_group.main : 
        k => {
          for i, u in v : 
            i => u
              if
                i != "members" &&
                i != "owners"
        }
  }
}

variable azuread_objects_array {
    type        = list(map(string))
    description = "Azure AD objects array"
}

locals {
    azuread_objects_map = { 
        for k, v in var.azuread_objects_array : 
            "${var.azuread_objects_array[k].resource}<=>${var.azuread_objects_array[k].name}" 
                => v
                    if 
                        v.type == "user_principal_name"
    }  
}

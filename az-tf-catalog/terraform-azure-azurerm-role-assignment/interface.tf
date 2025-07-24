variable azurerm_role_assignment_resource_map {
    type        = map(map(string))
    description = "resource for role assignments"
}
variable azurerm_role_assignment_array_dashboard_exists {
    default     = false
}
variable azurerm_role_assignment_principal_map {
    type        = map(map(string))
    description = "principals map"
    default     = {
    }
}
variable azurerm_role_assignment_array {
    type        = list(map(string))
    description = "role assignment list"
    default     = [
    ]
}
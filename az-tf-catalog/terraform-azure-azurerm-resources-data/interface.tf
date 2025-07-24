variable azurerm_resources_map {
    type = map(string)
    description = "resources map"
}
variable azurerm_required_tags {
    type = map(string)
    description = "tags map"
    default = {}
}

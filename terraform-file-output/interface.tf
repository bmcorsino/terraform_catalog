variable "output_file" {
    default = "tf-custom-result.out"
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "azurerm_resource_output" {
    default = []
}
locals {
  azurerm_resource_output_map = {
      for k, v in var.azurerm_resource_output :
        k => v
  }
}
variable "name" {}
variable "passwd_end_date" {}
variable "passwd_description" {}
variable "reply_urls" {
  default = []
}
variable "sign_in_audience" {
  default = "AzureADMyOrg"
}
variable "service_principal" {
  default = true
}
variable "azurerm_resource_depends_on" {
    default = [""]
}
variable "owners" {
  default = []
}
#@Deprecated
variable "available_to_other_tenants" {
  default = "false"
}
variable "passwd" {
  sensitive = true
  default   = ""
}
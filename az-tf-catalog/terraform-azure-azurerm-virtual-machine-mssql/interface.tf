variable "azure_region" {
  type    = "string"
  default = "westeurope"
}

variable "domain" {
  type    = "string"
  default = "cpdprd"
}


variable "azurerm_virtual_machine_os_profile_admin_password" {
  type    = "string"
  default="P2ssw0rd2019"

}

variable "azurerm_resource_group_name" {
  type    = "string"

}
variable "datadisk_size" {
  type    = "string"
  default ="120"

}

variable "sqlServerLicenseType" {
  type    = "string"
  default ="PAYG"
}
variable "adminUsername" {
  type    = "string"
      default="azureadmin"

}
variable "adminUserPassword" {
  type    = "string"
      default = "P2ssw0rd2019"

}

variable "sqlAuthenticationLogin" {
    type    = "string"
    default="azureadmin"
}

variable "sqlAuthenticationPassword" {
    type    = "string"
    default = "P2ssw0rd2019"

}

variable "azurerm_virtual_machine_storage_data_disk_managed_disk_type" {
  description = "Azure virtual machine data disk managed type"
  default     = "Standard_LRS"
}

variable "vmcount" {
  default =1
  
}
#Tags & resource defaults definiiton

variable "app_name" {
  type = "string"
  default="iac"
}

variable "BU" {
  type = "string"
  default = "DGU"
}

variable "tier" {
  default = "be"
 
}

variable "tshirt" {
    default =  "M"
    description = "Available sizes:, S,M,L,XL"
}

variable "environment" {
  type = "string"
  default = "dev"
}
variable "sub_environment" {
  type = "string"
  default = ""
}

variable "subnet_id" {
  type = "string"
  default = ""
}

variable "owner" {
  type = "string"
  default = "e351687"
}

variable "provisioning_date" {
  type = "string"
  default="2019-08-14"
}

variable "tag" {
  type = "string"
default ="sql-iaas"
}
 
variable "sufix" {
  type ="string"
  default="01"
}

variable "azurerm_domain_password" {
  type ="string"
  default="!Pa$$w0rd"
  
}

# VM SPECIFICS

variable  "azurerm_virtual_machine_os_publisher" {
type 	="string"
default ="MicrosoftWindowsServer"
}
variable  "azurerm_virtual_machine_os_offer" {
type 	="string"
default ="SQL2017-WS2016"
}
variable  "azurerm_virtual_machine_os_sku" {
type 	="string"
default ="SQLDEV"
}
 


locals {

subscription_id={
  dev="e0c332c0-0db1-41ca-8455-27bb848a48c9"
  shr="57701fdc-da76-4568-8afe-19859ba440d5"
  pre="8c6d7736-cd71-471d-a57a-e787cc0a13f4"
  prd="c9ef8f8a-e305-4fee-a85d-f3dfebf832f1"
  unm="4453ebc6-7b20-4867-98d2-dbcf7169e56c"
  devbda="b9da7760-06ab-447f-805e-fa1ac760e2d1"
  prebda="99426112-951a-46e1-a582-9569ea5e8f70"
  prdsrc="0007cda5-7dd8-4dec-86df-e1ddcfde3b0f"
  presrc="309035bd-c850-4a7d-80fa-828b766703f5"
}


//domain specific local Vars
azurerm_virtual_machine_extension_domain= { 
infra 	 = "infra.corp"
cpdprd   = "cpdprd.pt"
}


azurerm_virtual_machine_extension_ou_path= {
infra  ="OU=AZURE,OU=CLOUD,OU=SERVERS,OU=Administration,DC=infra,DC=corp"
cpdprd ="OU=AZURE,OU=CLOUD,OU=SERVERS,DC=CPDPRD,DC=PT"
}

azurerm_virtual_machine_extension_domain_user="saCLDAZRJDp01"


//environment + Sub_environment manipulation
env = "${var.environment}${var.sub_environment}"
sub_env = "${var.sub_environment == "" ? "" : "${var.sub_environment}-" }"
sub_env_resources = "${var.sub_environment == "" ? "" : "${var.sub_environment}" }"
env_tier = "${var.environment}${local.sub_env_resources}${var.tier}"

subnet_id={
  shrapp= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-shrservices-10.208.3.128_25"
  unmapp= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-10.216.0.0_22"
  devapp= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-fe-10.214.0.0_22"
  preapp= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-fe-10.212.0.0_22"
  prdapp= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-fe-10.210.0.0_22"
  devbdaapp="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.168.0_24"
  prebdaapp="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.184.0_24"
  prdsrcapp="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.160.0_24"
  presrcapp="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.176.0_24"
  
  shrbe= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-shrservices-10.208.3.128_25"
  unmbe= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-10.216.0.0_22"
  devbe= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-data-10.214.8.0_22"
  prebe= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-data-10.212.8.0_22"
  prdbe= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-data-10.210.8.0_22"
  devbdabe="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.168.0_24"
  prebdabe="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.184.0_24"
  prdsrcbe="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.160.0_24"
  presrcbe="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.Network/virtualNetworks/net-${var.environment}-vnet-${local.sub_env}01/subnets/net-${var.environment}-subnet-${local.sub_env}10.208.176.0_24" 
}

backup_policy_id={
  //dev ="e0c332c0-0db1-41ca-8455-27bb848a48c9"
  dev= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/backup-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}vault01/backupPolicies/backup${var.environment}-${local.sub_env}policy01"
  shr= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/backup-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}vault01/backupPolicies/backup${var.environment}-${local.sub_env}policy01"
  pre= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/backup-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}vault01/backupPolicies/backup${var.environment}-${local.sub_env}policy01"
  prd= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/backup-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}vault01/backupPolicies/backup${var.environment}-${local.sub_env}policy01"
  unm= "/subscriptions/${local.subscription_id[local.env]}/resourceGroups/backup-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}vault01/backupPolicies/backup${var.environment}-${local.sub_env}policy01"
  devbda="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}${local.sub_env}vault01/backupPolicies/DefaultPolicy"
  prebda="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}${local.sub_env}vault01/backupPolicies/DefaultPolicy"
  prdsrc="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}${local.sub_env}vault01/backupPolicies/DefaultPolicy"
  presrc="/subscriptions/${local.subscription_id[local.env]}/resourceGroups/net-${var.environment}-rg-${local.sub_env}01/providers/Microsoft.RecoveryServices/vaults/backup${var.environment}${local.sub_env}vault01/backupPolicies/DefaultPolicy"
 

}

tshirt_size={
  "S"  = "Standard_B2ms"
  "M"  = "Standard_B4ms"
  "L"  = "Standard_B8ms"
  "XL" = "Standard_B16ms"
 }
 tags ={
    owner            = "${var.owner}"
    bu               = "${var.BU}"
    Description      = "Resources dedicated to ${var.app_name} ${var.environment} environment "
    environment      = "${var.environment}"
    App              = "${var.app_name}"
    ProvisioningDate = "${var.provisioning_date}"
  
  }
}



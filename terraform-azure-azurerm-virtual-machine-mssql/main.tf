# =============== VARIABLES =============== #
 
 provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
      subscription_id = "${local.subscription_id[local.env]}" 
}
 
# =============== TEMPLATES =============== #
data "template_file" "sqlvm" {
  
  template = "${file("${path.module}/templates/sql_vm_azure_dbi.json")}"

}
 
# =============== RESOURCES =============== #
 
resource "azurerm_template_deployment" "sqlvm" {
  name                = "${var.app_name}${var.environment}${var.tier}${local.sub_env_resources}-template"
  resource_group_name = "${var.azurerm_resource_group_name}"
 
  template_body = "${data.template_file.sqlvm.rendered}"
 
  #DEPLOY
 
  # =============== PARAMETERS =============== #
  parameters = {
    "location"                         = "${var.azure_region}"                      # Location (westeurope by default)
    "subnetid" = "${local.subnet_id[local.env_tier]}"
    "networkInterfaceName"             = "${var.app_name}${var.environment}${var.tier}${local.sub_env_resources}${var.sufix}nic01"
    "enableAcceleratedNetworking"      = "false"                            # Enable Accelerating networking (always YES)
    "virtualMachineName"               = "${var.app_name}${var.environment}${var.tier}${local.sub_env_resources}${var.sufix}"
    "virtualMachineSize"               = "${local.tshirt_size[var.tshirt]}"            # Virtual machine size (Standard_DS13_v2)
    "image_ref_offer"                  = "${var.azurerm_virtual_machine_os_offer}"               # SQL Server Image Offer (SQL2017-WS2016, ...)
    "image_ref_sku"                    = "${var.azurerm_virtual_machine_os_sku}"               # SQL Server Image SKU (SQLDEV, ...)
    "image_ref_version"                = "latest"             # SQL Server Image version (latest, <version number>)   
    "adminUsername"                    = "${var.adminUsername}"                 # Virtual machine user name
    "adminUserPassword"                = "${var.adminUserPassword}"            # Virtual machine user password
    "osDiskType"                       = "${var.azurerm_virtual_machine_storage_data_disk_managed_disk_type}"                   # OS Disk type (Premium_LRS by default)
    "sqlDisklType"                     = "${var.azurerm_virtual_machine_storage_data_disk_managed_disk_type}"                  # SQL Disk type Premium_LRS by default)
    "diskSqlSizeGB"                    = "${var.datadisk_size}"                 # SQL Disk size (GB)
    "sqlVirtualMachineLocation"        = "${var.azure_region}"      # Virtual machine location
    "sqlVirtualMachineName"            = "${var.app_name}${var.environment}${var.tier}${local.sub_env_resources}${var.sufix}"
    "sqlServerLicenseType"             = "${var.sqlServerLicenseType}"          # SQL Server license type. - PAYG or AHUB
    "sqlConnectivityType"              = "LOCAL"           # LOCAL, PRIVATE, PUBLIC
    "sqlPortNumber"                    = "1433"                 # SQL listen port
    "sqlStorageDisksCount"             = "1"          # Nb of SQL disks to provision
    "sqlStorageWorkloadType"           = "GENERAL"        # Workload type GENERAL, OLTP, DW
    "sqlStorageDisksConfigurationType" = "NEW"                             # Configuration type NEW 
    "sqlStorageStartingDeviceId"       = "2"                               # Storage starting device id => Always 2
    "sqlAutopatchingDayOfWeek"         = "Sunday" # Day of week to apply the patch on. - Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
    "sqlAutopatchingStartHour"         = "2"      # Hour of the day when patching is initiated. Local VM time
    "sqlAutopatchingWindowDuration"    = "60" # Duration of patching
    "sqlAuthenticationLogin"           = "${var.sqlAuthenticationLogin}"        # Login SQL
    "sqlAuthUpdatePassword"            = "${var.sqlAuthenticationPassword}"     # Login SQL Password
    "rServicesEnabled"                 = "false"    
    "domainToJoin" ="${local.azurerm_virtual_machine_extension_domain[var.domain]}"
    "ouPath" ="${local.azurerm_virtual_machine_extension_ou_path[var.domain]}"
    "domainUsername" ="${local.azurerm_virtual_machine_extension_domain_user}"
    "domainJoinOptions" ="3" 
    "domainPassword" ="${var.azurerm_domain_password}"
    "command" ="net localgroup Administrators edp\\${var.owner} //add"
    "tag"                              = var.tag                           # Resource tags
  }
 
  deployment_mode = "Incremental"                                          # Deployment => incremental (complete is too destructive in our case) 
}

# dxc-rg-sa-vmwin-msql-iaas


## Creates the following project resources.

This Terraform module deploys a Single windows VM with a disk and a backup policy.
Additionaly Joins the VM to CPDPRD Domain and Adds owner ID as LocalGroup User.

## Tshirt Sizes
```hcl
"S"  = 2 vCPU, 	 8 GB memory
"M"  = 4 vCPU,  16 GB memory
"L"  = 8 vCPU,  32 GB memory
"XL" = 16 vCPU, 64 GB memory
```

## OS Versions
```
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/cli-ps-findimage

azurerm_virtual_machine_os_offer parameters can be found in the article below:
https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/germany/germany-image-gallery.md
```
## Usage

```hcl
module "dxc-rg-sa-vmwin-domjoin-mssql-iaas" {
    source                                                      = "git::ssh://git@bitbucket.agile.corp.dxc.pt:7999/ica/terraform-azure-azurerm-virtual-machine-mssql.git"
    azure_region                                                = "Westeurope"
    azurerm_resource_group_name                                 = "iac-dev-rg-02"
    azurerm_virtual_machine_os_profile_admin_password           = "MyStrongpassword"
    domain                                                      = "cpdprd"   //[infra, cpdprd]
    app_name                                                    = "loco"
    sufix                                                       = "01"
    BU                                                          = "DGU"
    tier                                                        = "be"//Use lowercase [app, web, be]
    tshirt                                                      = "S"
    environment                                                 = "dev"//Use lowercase [dev, shr, pre, prd]
    sub_environment                                             = ""//Use lowercase [bda,src, or if not present ""]
    owner                                                       = "E351687"
    provisioning_date                                           = "today"
    ####### DATADISK RELATED
    datadisk_size                                               = "120"          //GB
    azurerm_virtual_machine_storage_data_disk_managed_disk_type = "Standard_LRS" //[Standard_LRS, Premium_LRS]
    ####### OS/SQL VERSION RELATED
    azurerm_virtual_machine_os_publisher                        = "MicrosoftSQLServer"
    azurerm_virtual_machine_os_offer                            = "SQL2017-WS2016"
    azurerm_virtual_machine_os_sku                              = "SQLDEV" 
    ###### Auth settings
    sqlAuthenticationLogin                                      = "azureadmin"
    sqlAuthenticationPassword                                   = "P2ssw0rd2019"
    sqlServerLicenseType                                        = "AHUB"# SQL Server license type. - PAYG or AHUB
    azurerm_domain_password                                     = "MystrongPassword"

}

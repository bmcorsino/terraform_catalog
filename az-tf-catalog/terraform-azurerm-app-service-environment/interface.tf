
variable "azurerm_app_service_environment_name" {
    default = "ase-ENV-ase"
}
variable "azurerm_subnet_list" {
    default = []
}
variable "azurerm_app_service_environment_list" {
    default = {}
}
locals {
    azurerm_ase_suffix = {
      for k, v in var.azurerm_app_service_environment_list :
        k => "${k < 10 ? "0" : ""}${v.ase_data.ase_suffix}"
    }

    azurerm_ase_list = {
        for k, v in var.azurerm_app_service_environment_list :
          k => merge(v.ase_data, 
                    {
                        suffix      = v.ase_data.ase_suffix != "" ? v.ase_data.ase_suffix : local.azurerm_ase_suffix[k] 
                        subnet_id   = v.ase_data.ase_subnet_id_if_exists != "" ? v.ase_data.ase_subnet_id_if_exists : var.azurerm_subnet_list[k] // recupera primeira subnet criada
                    }
                )
    }
}
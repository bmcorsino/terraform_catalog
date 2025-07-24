provider "azurerm" {

}

resource "azurerm_template_deployment" "ipwhitelist" {
  name                = "${var.azurerm_app_service_name}-ipwhitelist"
  resource_group_name = "${var.azurerm_app_service_resource_group_name}"
  template_body       = <<JSON
{
  "$schema": "https://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "variables": {
     "_force_terraform_to_always_redeploy": "${timestamp()}"
  },
  "resources": [{
     "type":"Microsoft.Web/sites/config",
         "apiVersion":"2018-11-01",
         "name":"${var.azurerm_app_service_name}/web",
         "location":"[resourceGroup().location]",
         "properties":{
            "IpSecurityRestrictions":[
               {
                  "ipAddress":"195.245.180.0/24",
                  "action":"Allow",
                  "tag":"Default",
                  "priority":300,
                  "name":"kpmg-1",
                  "description":"kpmg-1"
               }
               ,{
                  "ipAddress":"195.245.185.0/24",
                  "action":"Allow",
                  "tag":"Default",
                  "priority":301,
                  "name":"kpmg-2",
                  "description":"kpmg-2"
               },{
                  "ipAddress":"185.58.80.0/24",
                  "action":"Allow",
                  "tag":"Default",
                  "priority":302,
                  "name":"kpmg-3",
                  "description":"kpmg-3"
               }
            ],
          "scmIpSecurityRestrictions":[
               {
                  "ipAddress":"195.245.180.0/24",
                  "action":"Allow",
                  "tag":"Default",
                  "priority":300,
                  "name":"kpmg-1",
                  "description":"kpmg-1"
               }
               ,{
                  "ipAddress":"195.245.185.0/24",
                  "action":"Allow",
                  "tag":"Default",
                  "priority":301,
                  "name":"kpmg-2",
                  "description":"kpmg-2"
               },{
                  "ipAddress":"185.58.80.0/24",
                  "action":"Allow",
                  "tag":"Default",
                  "priority":302,
                  "name":"kpmg-3",
                  "description":"kpmg-3"
               }
            ]
         }
    }
  ]
}
JSON
  deployment_mode     = "Incremental"
}
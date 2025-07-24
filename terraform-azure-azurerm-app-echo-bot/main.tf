# FAZ DEPLOY DO TEMPLATE "echo bot"
# SET ENV
resource "null_resource" "output_set_env" {
  provisioner "local-exec" {
    command  = "az account set --subscription ${var.subscription_id}"
  }
  depends_on = [var.azurerm_resource_depends_on]
}

# DEPLOY APP
resource "null_resource" "output_deploy" {
  provisioner "local-exec" {
    command  = "az webapp deployment source config-zip --resource-group ${var.resource_group_name} --name ${var.webapp_name} --src ${"${path.module}/templates/botapp.zip"}"
  }
  depends_on = [null_resource.output_set_env]
}

# CONFIRMA FINAL DO DEPLOY
resource "null_resource" "output_deploy_confirm" {
  provisioner "local-exec" {
    command  = "az webapp config appsettings set --resource-group ${var.resource_group_name} --name ${var.webapp_name} --settings SCM_DO_BUILD_DURING_DEPLOYMENT=true"
  }
  depends_on = [null_resource.output_deploy]
}
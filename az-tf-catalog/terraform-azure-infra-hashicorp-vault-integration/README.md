# terraform-azure-infra-hashicorp-vault-integration


## Store end Retrieve secrets on HashiCorp Vault - Azure Infrastructures

This Terraform module will be able to store and retrieve secrets used to managed Azure infrastructures

## Usage

More details on the following using guides:

[Jenkins Pipelines - Infra Pipelines - Terraform store a secret](https://confluence.agile.corp.kpmg.pt/display/DOPT/Jenkins+Pipelines+-+Infra+Pipelines+-+Terraform+store+a+secret)

[Jenkins Pipelines - Infra Pipelines - Terraform retrieve a secret](https://confluence.agile.corp.kpmg.pt/display/DOPT/Jenkins+Pipelines+-+Infra+Pipelines+-+Terraform+retrieve+a+secret)

Following a example calling Vault Infra Azure Integration to store a secret.
Feel free to change in order to test it using the [AutomatorTF Jenkins Pipeline - Free Style](https://jenkins.agile.corp.kpmg.pt/job/Automator/job/AutomatorTF/job/automator-terraform-free-style-dev/)

```hcl

# Call Resources and Modules

####################################################
##########           Infra                ##########
####################################################

module vault {

  # Module created to attend Infra Cloud
  source                    = "git::ssh://git@bitbucket.agile.corp.kpmg.pt:7999/DKV/vault-infra-azure-integration.git?ref=v1.0.0"

  #(Mandatory) - Hashicorp Vault Environment to be used - LOCAL / DEV / PRE / PRD
  vault_environment         = "DEV"

  #(Mandatory) - Hashicorp Vault Operation Type - STORE / RETRIEVE
  vault_operation_type      = "STORE"

  #(Mandatory) - Hashicorp Vault login username
  vault_login_username      = "<USERNAME>"

  #(Mandatory) - Hashicorp Vault login password
  vault_login_password      = "<PASSWORD>"

  #(Mandatory) - Azure Secret Type - SERVICE-PRINCIPAL / RESOURCES
  azure_infra_secret_type   = "RESOURCES"

  #(Optional - if use azure_infra_secret_type as "SERVICE-PRINCIPAL") - Azure Resource Name
  azure_resource_name       = "app-dev-mysql-01"

  #(Mandatory) - Azure Subscription Name - Pattern Name [kpmg-AZR-<BU>-<ENV>-<SEQUENCE>]
  azure_subscription_name   = "kpmg-AZR-DGU-DEV-01"

  #(Mandatory) - Azure Resource Group Name - Pattern Name [<APP_ACRONYM>-<ENV>-RG-<SUFIX>-<SEQUENCE>]
  azure_resource_group_name = "app-dev-rg-01"

  #(Mandatory) - Secret Name to be Store or to be Retrieve
  secret_name               = "saResourceName"

  #(Optional - if use vault_operation_type as "RETRIEVE") - Secret Value to be Store
  secret_value              = "saResourcePwd"
}

# Return Retrieved Secret Value if use vault_operation_type as RETRIEVE
output "retrieve_secret" {
  value                     = module.vault.retrieve_secret
  sensitive                 = true
  depends_on                = [module.vault]
}

# Return Secret path if use vault_operation_type as STORE
output "store_secret" {
  value                     = module.vault.store_secret
  sensitive                 = true
  depends_on                = [module.vault]
}

```

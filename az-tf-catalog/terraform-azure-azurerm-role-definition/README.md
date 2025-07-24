# terraform-azure-azurerm-role-definition


## Create a basic role definition

This Terraform module deploys a role definition in Azure

## Usage

```hcl
    environment                      = "dev" //[dev,pre,prd,shr,unm]
    sub_environment                  = "" //[bda, src, "" if not mentioned]
    role_definition_suffix           = "DEV"

    role_definition_list    = [
        {
            name = "kpmg_DGU_Azure_App_APIEngineer",
            actions = "Microsoft.AAD/*/read,Microsoft.aadiam/*/read,Microsoft.ADHybridHealthService/*/read,Microsoft.Advisor/*/read,Microsoft.AlertsManagement/*/read,Microsoft.AnalysisServices/*,Microsoft.ApiManagement/*/read"
        },
        {
            name = "kpmg_DGU_Azure_App_AppOwner",
            actions = ""
        },
        {
            name = "kpmg_DGU_Azure_App_Developer",
            actions = "Microsoft.ADHybridHealthService/*/read,Microsoft.Advisor/*/read,Microsoft.AlertsManagement/*/read,Microsoft.AnalysisServices/*,Microsoft.ApiManagement/*/read"
        },
        {
            name = "kpmg_DGU_Azure_App_Monitoring",
            actions = "Microsoft.ADHybridHealthService/*/read"
        },
        {
            name = "kpmg_DGU_Azure_App_Operator",
            actions = "Microsoft.ADHybridHealthService/*/read"
        },
        {
            name = "kpmg_DGU_Azure_App_ProjectManagement",
            actions = "Microsoft.ADHybridHealthService/*/read"
        },
        {
            name = "kpmg_DGU_Azure_App_ReadAll",
            actions = "Microsoft.ADHybridHealthService/*/read"
        },
        {
            name = "kpmg_DGU_Azure_App_Tester",
            actions = "Microsoft.ADHybridHealthService/*/read"
        }
    ]

```


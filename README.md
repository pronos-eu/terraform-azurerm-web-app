# Terraform AzureRM Web App Module

Terraform module to deploy 1+ web apps under one service plan.

---
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app\_plan\_name | Name of app service plan to create | string | n/a | yes |
| apps | Map of application and its settings | any | n/a | yes |
| resource\_group\_name | Name of resource group | string | n/a | yes |
| app\_kind | Kind of app service plan | string | `"Windows"` | no |
| location | Azure region where resources will be created | string | `"northeurope"` | no |
| sku\_capacity | Specifies number of workers associated with this App Service Plan | string | `"null"` | no |
| sku\_size | Specifies the plan's instance size | string | `"F1"` | no |
| sku\_tier | Specifies the plan's pricing tier | string | `"Free"` | no |
| tags | Map of tags to assign to resources | map | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| apps | Map of deployed web applications |
| site\_credentials | Map of site credentials for applications |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

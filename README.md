# Terraform AzureRM Web App Module

Terraform module to deploy 1+ web apps under one service plan.


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

## Example Apps settings

```terraform
apps = {
  api = {
    name      = "project-api"
    always_on = true
    app_settings = {
      "WEBSITE_NODE_DEFAULT_VERSION" = "8.11.1"
    }
    use_32_bit_worker_process = false
  },
  web = {
    name = "project-web"
    tags = {}
    app_settings = {
      "WEBSITE_NODE_DEFAULT_VERSION" = "8.11.1"
    }
    default_documents = [
      "Default.htm",
      "Default.html",
      "Default.asp",
      "index.htm",
      "index.html",
      "iisstart.htm",
      "default.aspx",
      "index.php",
      "hostingstart.html",
    ]
  }
}
```

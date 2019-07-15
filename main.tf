data "azurerm_resource_group" "app_resource_group" {
  name = var.resource_group_name
}

resource "azurerm_app_service_plan" "app_plan" {
  name                = var.app_plan_name
  location            = data.azurerm_resource_group.app_resource_group.location
  resource_group_name = data.azurerm_resource_group.app_resource_group.name
  kind                = var.app_kind
  tags                = var.tags

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_app_service" "web_app" {
  count               = length(var.app_names)
  name                = var.app_names[count.index]
  location            = data.azurerm_resource_group.app_resource_group.location
  resource_group_name = data.azurerm_resource_group.app_resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id
  tags                = var.tags
  app_settings        = var.app_settings[count.index]

  site_config {
    always_on                 = true
    websockets_enabled        = var.websockets_enabled[count.index]
    use_32_bit_worker_process = var.use_32_bit_worker_process
    scm_type                  = var.scm_type[count.index]
    default_documents         = var.default_documents[count.index]
  }

  lifecycle {
    ignore_changes = [
      site_config.0.scm_type
    ]
  }
}

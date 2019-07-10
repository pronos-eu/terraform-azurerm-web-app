resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_app_service_plan" "app_plan" {
  name                = var.app_plan_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
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
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_plan.id
  tags                = var.tags
  app_settings        = var.app_settings[count.index]

  site_config {
    always_on                 = true
    websockets_enabled        = var.websockets_enabled[count.index]
    use_32_bit_worker_process = var.use_32_bit_worker_process
  }
}

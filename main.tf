data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_app_service_plan" "main" {
  name                = var.app_plan_name
  location            = coalesce(var.location, data.azurerm_resource_group.main.location)
  resource_group_name = data.azurerm_resource_group.main.name
  kind                = var.app_kind
  tags                = var.tags

  sku {
    tier = var.sku_tier
    size = var.sku_size
  }
}

resource "azurerm_app_service" "main" {
  for_each            = var.apps
  name                = lookup(each.value, "name")
  location            = coalesce(var.location, data.azurerm_resource_group.main.location)
  resource_group_name = data.azurerm_resource_group.main.name
  app_service_plan_id = azurerm_app_service_plan.main.id
  tags                = "${merge(var.tags, lookup(each.value, "tags", {}))}"
  app_settings        = lookup(each.value, "app_settings", {})

  site_config {
    always_on                 = lookup(each.value, "always_on", "false")
    websockets_enabled        = lookup(each.value, "websockets_enabled", "false")
    use_32_bit_worker_process = lookup(each.value, "use_32_bit_worker_process", "true")
    scm_type                  = lookup(each.value, "scm_type", "None")
    default_documents         = lookup(each.value, "default_documents", [])
  }

  lifecycle {
    ignore_changes = [
      site_config.0.scm_type
    ]
  }
}

output "web_apps_ids" {
  value = azurerm_app_service.web_app.*.id
}

output "web_apps_names" {
  value = azurerm_app_service.web_app.*.name
}

output "web_apps_outbound_ips" {
  value = azurerm_app_service.web_app.*.outbound_ip_addresses
}

output "web_apps_possible_outbound_ips" {
  value = azurerm_app_service.web_app.*.possible_outbound_ip_addresses
}

output "web_apps_hostnames" {
  value = azurerm_app_service.web_app.*.default_site_hostname
}

output "web_apps_site_credentials" {
  value = azurerm_app_service.web_app.*.site_credential
}

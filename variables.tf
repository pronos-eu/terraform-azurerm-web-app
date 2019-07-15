variable "resource_group_name" {
  type        = string
  description = "Name of resource group"
  default     = "web-app-rg"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "northeurope"
}

variable "app_plan_name" {
  type        = string
  description = "Name of app service plan to create"
  default     = "app-plan"
}

variable "app_kind" {
  type    = string
  default = "Windows"
}

variable "sku_tier" {
  type    = string
  default = "Standard"
}

variable "sku_size" {
  type    = string
  default = "S1"
}

variable "app_names" {
  type        = list(string)
  description = "List of app names to create."
  default     = ["web-app"]
}

variable "websockets_enabled" {
  type        = list(bool)
  description = "Determines if websockets should be enabled for web apps"
  default     = [false]
}

variable "use_32_bit_worker_process" {
  type        = bool
  description = "When using an App Service Plan in the Free or Shared Tiers use_32_bit_worker_process must be set to true."
  default     = true
}

variable "app_settings" {
  type        = list
  description = "List of application settings to set on deploy."
  default     = [null]
}

variable "scm_type" {
  type        = list(string)
  description = "SCM Type for app."
  default     = [null]
}

variable "default_documents" {
  type        = list(string)
  description = "List of default documents to load if not specified in address of web app"
  default     = [null]
}

variable "tags" {
  type        = "map"
  description = "Map of tags to assign to resources"
  default     = {}
}

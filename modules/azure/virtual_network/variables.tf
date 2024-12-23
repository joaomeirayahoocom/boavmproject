/*
variable "nsg_name" {
  type        = string
  description = ""
  default     = "nsg-dev-azlz-01"
}

variable "nsg_location" {
  type        = string
  description = ""
  default     = "WestUS3"
}

variable "nsg_resource_group" {
  type        = string
  description = ""
  default     = "rgvnet-azlz-01"
}

variable "vnet_name" {
  type        = string
  description = ""
  default     = "vnet-dev-azlz-01"
}

variable "vnet_location" {
  type        = string
  description = ""
  default     = "WestUS3"
}

variable "vnet_resource_group" {
  type        = string
  description = ""
  default = "rgvnet-azlz-01"
}

variable "resource_group_location" {
}

variable "resource_group_name" {
}
*/

variable "vnet_name" {

  type        = string
  description = ""
  default     = "TCB-Dev-core-westus3"
}

variable "network_security_group_id" {
}

variable "resource_group_location" {
}

variable "resource_group_name" {
}

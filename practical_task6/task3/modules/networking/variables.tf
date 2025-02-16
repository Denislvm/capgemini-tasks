variable "resource_group" {
  default     = "DenisSlyusarenko"
  description = "rs name"
}

variable "location" {
  type    = string
  default = "Central US"
}

variable "domain_name_label" {
  default     = "denisslyusarenko"
  description = "Domain name label for the public IP"
}

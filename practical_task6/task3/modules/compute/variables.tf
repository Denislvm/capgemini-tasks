variable "resource_group" {
  default     = "DenisSlyusarenko"
  description = "rs name"
}

variable "ssh_public_key" {
  default = "~/.ssh/rsaazurekey_pub"
}

variable "location" {
  type    = string
  default = "Central US"
}

variable "subnet_id" {
  description = "The ID of the subnet for the compute resources"
  type        = string
}

variable "lb_public_ip_id" {
  description = "The ID of the public IP for the load balancer"
  type        = string
}

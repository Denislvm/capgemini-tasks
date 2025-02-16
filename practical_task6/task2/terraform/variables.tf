variable "resource_group_name" {
  default = "DenisSlyusarenko"
  description = "rs name"
}

variable "ssh_public_key" {
  default = "~/.ssh/rsaazurekey_pub"
}

variable "ssh_private_key" {
  default = "~/.ssh/rsaazurekey"
}

variable "location" {
    type = string
    default = "Central US"  
}

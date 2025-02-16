module "networking" {
  source         = "./modules/networking"
  resource_group = var.resource_group
  location       = var.location
}

module "security" {
  source         = "./modules/security"
  resource_group = var.resource_group
  location       = var.location
}

module "compute" {
  source         = "./modules/compute"
  resource_group = var.resource_group
  location       = var.location
  subnet_id       = module.networking.subnet_id
  lb_public_ip_id = module.networking.lb_public_ip_id
}


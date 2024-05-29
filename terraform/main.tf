module "vpc" {
  source                = "./modules/VPC"
  name                  = var.name
  vpc_cidr              = var.vpc_cidr
  region                = var.region
  public_subnet_config  = var.public_subnet_config
}

module "eks" {
  source = "./modules/EKS"
  name   = var.name
  public_subnet_ids = module.vpc.public_subnet_ids

  desired_size    = var.desired_size
  max_size        = var.max_size
  min_size        = var.min_size
  max_unavailable = var.max_unavailable
}


provider "aws" {
  region = var.region
}

module "networking" {
  source              = "./modules/networking"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = "three-tier-vpc"
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidrs = var.public_subnet_cidrs
  app_subnet_cidrs    = var.app_subnet_cidrs
  db_subnet_cidrs     = var.db_subnet_cidrs
  availability_zones  = var.availability_zones
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.networking.public_subnet_ids
  web_sg_id      = module.security_groups.web_sg_id
}

module "asg" {
  source           = "./modules/app_asg"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_pair
  app_sg_id        = module.security_groups.app_sg_id
  app_subnet_ids   = module.networking.app_subnet_ids
  target_group_arn = module.alb.target_group_arn
}

module "rds" {
  source        = "./modules/rds"
  db_subnet_ids = module.networking.db_subnet_ids
  db_sg_id      = module.security_groups.db_sg_id
  db_username   = var.db_username
  db_password   = var.db_password
}


resource "aws_instance" "imported" {
  ami = "ami-0150ccaf51ab55a51"
  instance_type = "t2.micro"
  
  tags = {
    Name = "impIns"
    instance_id = "i-0c60baaf2eafe4d7a"
  }
}
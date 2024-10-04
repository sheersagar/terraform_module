terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
      }
    }
}


provider "aws" {
  region = "ap-south-1"
}


################ Now Creating Module  ################

module "vpc" {
  source = "./modules/VPC"
  main_vpc = var.main_vpc
}


module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.main_vpc_id
  pb_sn_az1_cidr = var.pb_sn_az1_cidr
  pb_sn_az2_cidr = var.pb_sn_az2_cidr
  pb_sn_az3_cidr = var.pb_sn_az3_cidr
  pvt_sn_app_az1_cidr = var.pvt_sn_app_az1_cidr
  pvt_sn_app_az2_cidr = var.pvt_sn_app_az2_cidr
  pvt_sn_app_az3_cidr = var.pvt_sn_app_az3_cidr
  pvt_sn_db_az1_cidr = var.pvt_sn_db_az1_cidr
  pvt_sn_db_az2_cidr = var.pvt_sn_db_az2_cidr
  pvt_sn_db_az3_cidr = var.pvt_sn_db_az3_cidr
  depends_on = [ module.vpc ]
}

module "internet_gateway" {
  source = "./modules/igw"
  vpc_id = module.vpc.main_vpc_id
}


module "nat" {
  source = "./modules/nat"
  pb_sn_az1_cidr = var.pb_sn_az1_cidr
  nat_gateway = module.nat.nat_gateway_id
  pb_sn_az1_id = module.subnets.public_subnet_ids[0]
  
}


module "route-tables" {
  source = "./modules/routeTable"
  vpc_id = module.vpc.main_vpc_id
  public_subnet_ids = module.subnets.public_subnet_ids
  private_db_subnet_ids = module.subnets.private_db_subnet_ids
  private_app_subnet_ids = module.subnets.private_app_subnet_ids 
  internet_gateway = module.internet_gateway.internet_gateway_id
  nat_gateway = module.nat.nat_gateway_id
}





module "securityGroup" {
  source = "./modules/securityGroup"
  vpc_id = module.vpc.main_vpc_id
  ingress_rules_pb_sg = var.ingress_rules_pb_sg
  ingress_pvt_app_sg = var.ingress_pvt_app_sg
  ingress_pvt_db_sg = var.ingress_pvt_db_sg
  ingress_rules_lb = var.ingress_rules_lb
}
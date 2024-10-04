

# Get All the availability zones inside of the VPC
# We will use the data block 

data "aws_availability_zones" "az" {
  state = "available"
}


## Local Variable
locals {
  public_subnets = {
    az1 = var.pb_sn_az1_cidr
    az2 = var.pb_sn_az2_cidr
    az3 = var.pb_sn_az3_cidr
  }

  private_app_subnets = {
    az1 = var.pvt_sn_app_az1_cidr
    az2 = var.pvt_sn_app_az2_cidr
    az3 = var.pvt_sn_app_az3_cidr
  }

  private_db_subnets = {
    az1 = var.pvt_sn_db_az1_cidr
    az2 = var.pvt_sn_db_az2_cidr
    az3 = var.pvt_sn_db_az3_cidr
  }
}

###############  PUBLIC SUBNET  ###################
###############                 ###################

# Public Subnet in AZ1 ----> pb = public, sn = subnet, az1 = availability zone 1
resource "aws_subnet" "public" {
  for_each = local.public_subnets
  vpc_id = var.vpc_id
  cidr_block = each.value
  availability_zone = data.aws_availability_zones.az.names[tonumber(substr(each.key, -1, 1)) - 1]

  # It will make sure that public ip address is assigned
  map_public_ip_on_launch = true

  tags = {
    Name = "pb-sn-${each.key}"
  }
}




#################  PRIVATE APP SUBNET ###############
#################                     ###############
resource "aws_subnet" "private_app_subnets" {
  for_each = local.private_app_subnets
  vpc_id = var.vpc_id
  cidr_block = each.value
  availability_zone = data.aws_availability_zones.az.names[tonumber(substr(each.key, -1, 1)) - 1]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-sn-${each.key}"
  }

}




################  PRIVATE DB SUBNET #################
################                    #################
resource "aws_subnet" "private_db_subnets" {
  for_each = local.private_db_subnets
  vpc_id = var.vpc_id
  cidr_block = each.value
  availability_zone = data.aws_availability_zones.az.names[tonumber(substr(each.key, -1, 1)) - 1]
  map_public_ip_on_launch = false 

  tags = {
    Name = "private-db-${each.key}"
  }
}
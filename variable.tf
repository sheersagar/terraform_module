
variable "main_vpc" {
  type = string
}

variable "pb_sn_az1_cidr" {
    type = string
}

variable "pb_sn_az2_cidr" {
    type = string
}

variable "pb_sn_az3_cidr" {

}



##########

variable "pvt_sn_app_az1_cidr" {
  type = string
}

variable "pvt_sn_app_az2_cidr" {
  type = string
}

variable "pvt_sn_app_az3_cidr" {
  type = string
}



##########

variable "pvt_sn_db_az1_cidr" {
  type = string
}

variable "pvt_sn_db_az2_cidr" {
    type = string
}

variable "pvt_sn_db_az3_cidr" {
    type = string
}


######## Security Group

variable "ingress_rules_pb_sg" {
  type = list(object({
    from_port  = number
    to_port    = number
    protocol   = string
    cidr_block = list(string)
  }))
  // Usually we will not put values in the default section, we will put the values in .tfvars file 
  # default = [ 
  # ]
}


## Pvt DB Variables
variable "ingress_pvt_db_sg" {
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    security_groups = list(string)
  }))
}


## Pvt APP Variable SG
variable "ingress_pvt_app_sg" {
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    security_groups = list(string)
  }))
}

## Load balancer variable
variable "ingress_rules_lb" {
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_block = list(string)
  }))
}

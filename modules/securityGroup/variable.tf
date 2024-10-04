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
    cidr_block = optional(list(string))
  }))
}


## Pvt APP Variable SG
variable "ingress_pvt_app_sg" {
  type = list(object({
    from_port = number
    to_port = number
    protocol = string
    cidr_block = optional(list(string))
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


## This value will be passed on from root module, there is no value for this variable
## in the tfvar file
variable "vpc_id" {
  type        = string
  description = "This value will be provided by VPC module"
}



###################  NON OPTIMIZED CODE VARIABLE FILES ###########################
###################                                    ###########################bu
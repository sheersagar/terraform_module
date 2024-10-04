variable "internet_gateway" {
  type = string
}

variable "vpc_id" {
  type = string
}


variable "nat_gateway" {
  type = string
}


variable "public_subnet_ids" {
  type = list(string)
  description = "List of public subnet Ids"
}

variable "private_app_subnet_ids" {
  type = list(string)
  description = "List of private app subnet ids"
}

variable "private_db_subnet_ids" {
  type = list(string)
  description = "List of private db subnet ids"
}
# Creating the Main VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.main_vpc
  enable_dns_support = true
  enable_dns_hostnames = true
#   enable_dns_hotnames = true  --> Why it is throwing error(will look into it)

  tags = {
    Name = "main-vpc"
  }
}
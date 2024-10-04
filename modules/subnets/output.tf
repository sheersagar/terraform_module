###############  PUBLIC SUBNET OUTPUTS  ###################

# Output the CIDR blocks of public subnets in all AZs
output "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets in all AZs"
  value       = [for key, subnet in aws_subnet.public : subnet.cidr_block]
}

# Output the subnet IDs of public subnets in all AZs
output "public_subnet_ids" {
  description = "Subnet IDs for public subnets in all AZs"
  value       = [for key, subnet in aws_subnet.public : subnet.id]
}

# Output the availability zones of public subnets in all AZs
output "public_subnet_azs" {
  description = "Availability Zones for public subnets"
  value       = [for key, subnet in aws_subnet.public : subnet.availability_zone]
}


###############  PRIVATE APP SUBNET OUTPUTS  ###################

# Output the CIDR blocks of private app subnets in all AZs
output "private_app_subnet_cidr_blocks" {
  description = "CIDR blocks for private app subnets in all AZs"
  value       = [for key, subnet in aws_subnet.private_app_subnets : subnet.cidr_block]
}

# Output the subnet IDs of private app subnets in all AZs
output "private_app_subnet_ids" {
  description = "Subnet IDs for private app subnets in all AZs"
  value       = [for key, subnet in aws_subnet.private_app_subnets : subnet.id]
}

# Output the availability zones of private app subnets in all AZs
output "private_app_subnet_azs" {
  description = "Availability Zones for private app subnets"
  value       = [for key, subnet in aws_subnet.private_app_subnets : subnet.availability_zone]
}


###############  PRIVATE DATABASE SUBNET OUTPUTS  ###################

# Output the CIDR blocks of private DB subnets in all AZs
output "private_db_subnet_cidr_blocks" {
  description = "CIDR blocks for private database subnets in all AZs"
  value       = [for key, subnet in aws_subnet.private_db_subnets : subnet.cidr_block]
}

# Output the subnet IDs of private DB subnets in all AZs
output "private_db_subnet_ids" {
  description = "Subnet IDs for private database subnets in all AZs"
  value       = [for key, subnet in aws_subnet.private_db_subnets : subnet.id]
}

# Output the availability zones of private DB subnets in all AZs
output "private_db_subnet_azs" {
  description = "Availability Zones for private database subnets"
  value       = [for key, subnet in aws_subnet.private_db_subnets : subnet.availability_zone]
}

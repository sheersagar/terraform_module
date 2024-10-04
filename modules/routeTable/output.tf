output "aws_route_table_pub_id" {
  value = aws_route_table.pb_rt.id
  description = "It will provide the id of the public route table"
}


output "aws_route_table_pub_arn" {
  value = aws_route_table.pb_rt.arn
  description = "It will provide the ARN of public route table"
}

output "aws_route_table_pub_name" {
  value = aws_route_table.pb_rt.tags["Name"]
  description = "It will provide the name of the Public route table"
}


#############
output "aws_route_table_pvt_app_nat_id" {
  value = aws_route_table.pvt_app_nat.id
  description = "It will provide the id of the Private APP-NAT route table"
}


output "aws_route_table_pvt_app_nat_arn" {
  value = aws_route_table.pvt_app_nat.arn
  description = "It will provide the ARN of Private APP-NAT route table"
}

output "aws_route_table_pvt_app_nat_name" {
  value = aws_route_table.pvt_app_nat.tags["Name"]
  description = "It will provide the name of the Private APP route table"
}


###################
output "aws_route_table_pvt_db_nat_id" {
  value = aws_route_table.pvt_db_nat.id
  description = "It will provide the id of the Private DB-NAT route table"
}


output "aws_route_table_pvt_db_nat_arn" {
  value = aws_route_table.pvt_db_nat.arn
  description = "It will provide the ARN of Private DB-NAT route table"
}

output "aws_route_table_pvt_db_nat_name" {
  value = aws_route_table.pvt_db_nat.tags["Name"]
  description = "It will provide the name of the Private DB-NAT route table"
}



###########
# Output of Subnet Associations
output "public_subnet_route_table_association_ids" {
  description = "Route table association IDs for public subnets"
  value       = [
    aws_route_table_association.public_association_az1.id,
    aws_route_table_association.public_association_az2.id,
    aws_route_table_association.public_association_az3.id,
  ]
}

output "private_app_subnet_route_table_association_ids" {
  description = "Route table association IDs for private app subnets"
  value       = [
    aws_route_table_association.private_app_association_az1.id,
    aws_route_table_association.private_app_association_az2.id,
    aws_route_table_association.private_app_association_az3.id,
  ]
}

output "private_db_subnet_route_table_association_ids" {
  description = "Route table association IDs for private database subnets"
  value       = [
    aws_route_table_association.private_db_association_az1.id,
    aws_route_table_association.private_db_association_az2.id,
    aws_route_table_association.private_db_association_az3.id,
  ]
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
  description = "It will provide the ID of NAT Gateway"
}

output "nat_gateway_name" {
  value = aws_nat_gateway.nat_gateway.tags["Name"]
  description = "It will provide the Name of NAT Gateway"
}

output "nat_gateway_allocation_id" {
  value = aws_nat_gateway.nat_gateway.allocation_id
  description = "It will provide the allocation Id for NAT gateway"
}


output "nat_gateway_private_ip" {
  value = aws_nat_gateway.nat_gateway.private_ip
  description = "It will provide the Private IP of Nat Gateway"
}


output "nat_gateway_public_ip" {
  value = aws_nat_gateway.nat_gateway.public_ip
  description = "It will provide the public ip of NAT gateway"
}



## Currently nat arn is not supported in AWS
# output "aws_nat_gateway_arn" {
#   value = aws_nat_gateway.nat_gateway.arn 
#   description = "It will provide the ARN of NAT Gateway"
# }
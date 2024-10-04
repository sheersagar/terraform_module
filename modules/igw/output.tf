
output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
  description = "It will provide the ID of internete gateway"
}

output "internet_gateway_arn" {
  value = aws_internet_gateway.internet_gateway.arn
  description = "It will provide the ARN of Internet Gateway"
}

output "internet_gateway_name" {
  value = aws_internet_gateway.internet_gateway.tags["Name"]
  description = "It will provide the name of internet gateway"
}
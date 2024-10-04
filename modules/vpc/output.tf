output "main_vpc_cidr" {
  value = aws_vpc.main_vpc.cidr_block
  description = "This will print only the CIDR value of the MAIN VPC"
}

output "main_vpc_id" {
  value = aws_vpc.main_vpc.id
  description = "This will give the actual ID of your main VPC"
}

output "main_vpc_arn" {
  value = aws_vpc.main_vpc.arn
  description = "This will give the description of the main VPC ARN"
}
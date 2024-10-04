# Allocating Elastic IP
resource "aws_eip" "nat_eip" {
  
}



resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id = var.pb_sn_az1_id

  tags = {
    Name = "Common NAT Gateway"
  }
}
## Creating Route table (Public subnet and IGW)

resource "aws_route_table" "pb_rt" {
    vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway
  }

  tags = {
    Name = "Public Route Table"
  }
}


## Route table for Pvt App---> NAT Gateway
resource "aws_route_table" "pvt_app_nat" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway
  }

  tags = {
    Name = "Private App-NAT Route Table"
  }
}


### Route table for Pvt DB ----> NAT Gateway
resource "aws_route_table" "pvt_db_nat" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.nat_gateway
  }

  tags = {
    Name = "Private DB-NAT Route Table"
  }
}



##########  Creating  Route Association  ###########
##########  Creating  Route Association  ###########

# Public Subnet Associations
resource "aws_route_table_association" "public_association_az1" {
  subnet_id      = var.public_subnet_ids[0]
  route_table_id = aws_route_table.pb_rt.id
}

resource "aws_route_table_association" "public_association_az2" {
  subnet_id      = var.public_subnet_ids[1]
  route_table_id = aws_route_table.pb_rt.id
}

resource "aws_route_table_association" "public_association_az3" {
  subnet_id      = var.public_subnet_ids[2]
  route_table_id = aws_route_table.pb_rt.id
}

# Private App Subnet Associations
resource "aws_route_table_association" "private_app_association_az1" {
  subnet_id      = var.private_app_subnet_ids[0]
  route_table_id = aws_route_table.pvt_app_nat.id
}

resource "aws_route_table_association" "private_app_association_az2" {
  subnet_id      = var.private_app_subnet_ids[1]
  route_table_id = aws_route_table.pvt_app_nat.id
}

resource "aws_route_table_association" "private_app_association_az3" {
  subnet_id      = var.private_app_subnet_ids[2]
  route_table_id = aws_route_table.pvt_app_nat.id
}

# Private DB Subnet Associations
resource "aws_route_table_association" "private_db_association_az1" {
  subnet_id      = var.private_db_subnet_ids[0]
  route_table_id = aws_route_table.pvt_db_nat.id
}

resource "aws_route_table_association" "private_db_association_az2" {
  subnet_id      = var.private_db_subnet_ids[1]
  route_table_id = aws_route_table.pvt_db_nat.id
}

resource "aws_route_table_association" "private_db_association_az3" {
  subnet_id      = var.private_db_subnet_ids[2]
  route_table_id = aws_route_table.pvt_db_nat.id
}


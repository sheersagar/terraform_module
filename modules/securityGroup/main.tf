

## Securtiy group for Public subnet
resource "aws_security_group" "pb_sg" {
  name = "pg-sn-sg"
  vpc_id = var.vpc_id
  description = "It will allow almost all types of traffic to public subnet"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0"]
  }
}

## Non Optimized Code for Ingress Rules for Public subnet




## Define Ingress for pb_sg so that there is no cyclic dependency error
resource "aws_security_group_rule" "ingress_pb_sg" {
  count = length(var.ingress_rules_pb_sg)
  security_group_id = aws_security_group.pb_sg.id
  from_port = var.ingress_rules_pb_sg[count.index].from_port
  to_port = var.ingress_rules_pb_sg[count.index].to_port
  protocol = var.ingress_rules_pb_sg[count.index].protocol
  cidr_blocks = var.ingress_rules_pb_sg[count.index].cidr_block
  type = "ingress"
}


######## Security group for the Private Subnet ---> Public Subnet
########
resource "aws_security_group" "pvt_db_sg" {
  name        = "pvt-db-sg"
  description = "It will manage traffic between public and private database subnet"
  vpc_id      = var.vpc_id
  depends_on = [ aws_security_group.pb_sg ]

  # dynamic "ingress" {
  #   for_each = local.ingress_pvt_db_sg
  #   content {
  #     from_port       = ingress.value.from_port
  #     to_port         = ingress.value.to_port
  #     protocol        = ingress.value.protocol
  #     security_groups = ingress.value.security_groups
  #   }
  # }

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [ aws_security_group.pb_sg.id ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



########## Security grou Pvt-App ------> public subnet
##########

resource "aws_security_group" "pvt_app_sg" {
  name = "pvt-app-sg"
  description = "It will allow traffic between public subnet and pvt-app-sg"
  vpc_id = var.vpc_id
  depends_on = [ aws_security_group.pb_sg ]

  # dynamic "ingress" {
  #   for_each = local.ingress_pvt_app_sg
  #   content {
  #     from_port = ingress.value.from_port
  #     to_port = ingress.value.to_port
  #     protocol = ingress.value.protocol
  #     security_groups = ingress.value.security_groups
  #   }
  # }

  ingress {
    from_port = 2049
    to_port = 2049
    protocol = "tcp"
    security_groups = [ aws_security_group.pb_sg.id ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#### Load Balancer security group
resource "aws_security_group" "lb_sg" {
  name = "alb-security-group"
  description = "It will allow traffic from outside to land"
  vpc_id = var.vpc_id
  depends_on = [ aws_security_group.pb_sg ]
}

## Ingress rule for ALB so that to prevent cycle error
resource "aws_security_group_rule" "lb_ingress_rule" {
  count = length(var.ingress_rules_lb)
  security_group_id = aws_security_group.lb_sg.id
  type = "ingress"
  protocol = var.ingress_rules_lb[count.index].protocol
  from_port = var.ingress_rules_lb[count.index].from_port
  to_port = var.ingress_rules_lb[count.index].to_port
  cidr_blocks = var.ingress_rules_lb[count.index].cidr_block
}




## Local variable for private DB ---> public subnet conectivity
  ## We used local variables only, because we need the id of public
      # security group, which we cannot pass in tfvars file as reference
      # because it hasn't been created, hence we used local variable
      # and refer it's value, and in pvt-sg, use local variables.
locals {
  ingress_pvt_db_sg = [
    {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.pb_sg.id]
    }
  ]
  ingress_pvt_app_sg = [
    {
      from_port = 2049
      to_port = 2049
      protocol = "tcp"
      security_groups = [aws_security_group.pb_sg.id]
    }
  ]
}




####### Output Public SG  #######

output "security_group_pb" {
  value = [
    {
      id  = aws_security_group.pb_sg.id
      arn = aws_security_group.pb_sg.arn
      name = aws_security_group.pb_sg.name
    }
  ]
  description = "Details of the public security group."
}

output "pvt_db_sg" {
  value = [
    {
      id  = aws_security_group.pvt_db_sg.id
      arn = aws_security_group.pvt_db_sg.arn
      name = aws_security_group.pvt_db_sg.name
    }
  ]
  description = "Details of the private database security group."
}

output "pvt_app_sg" {
  value = [
    {
      id  = aws_security_group.pvt_app_sg.id
      arn = aws_security_group.pvt_app_sg.arn
      name = aws_security_group.pvt_app_sg.name
    }
  ]
  description = "Details of the private application security group."
}

output "lb_sg" {
  value = [
    {
      id  = aws_security_group.lb_sg.id
      arn = aws_security_group.lb_sg.arn
      name = aws_security_group.lb_sg.name
    }
  ]
  description = "Details of the load balancer security group."
}



################### 
output "ingress_rules_lb" {
  description = "It will provide the rules for the Load balancer Security groups in the form of Objects"
  value = [
    for rule in aws_security_group_rule.lb_ingress_rule : {
      from_port = rule.from_port
      to_port = rule.to_port
      protocol = rule.protocol
      cidr_block = rule.cidr_blocks
    }
  ]
}


output "ingress_rules_pb_sg" {
  description = "List of ingress rules for the Public Subnet Security Group in the form of Objects"
  value = [
    for i in range(length(var.ingress_rules_pb_sg)) : {
      from_port = var.ingress_rules_pb_sg[i].from_port
      to_port = var.ingress_rules_pb_sg[i].to_port
      protocol = var.ingress_rules_pb_sg[i].protocol
      cidr_block = var.ingress_rules_pb_sg[i].cidr_block
    }
  ]
}

output "ingress_rules_pvt_app_sg" {
  description = "List of ingress rules for the Private App Subnet Security Group in the form of Objects"
  value = [
    for i in range(length(var.ingress_pvt_app_sg)) : {
      from_port = var.ingress_pvt_app_sg[i].from_port
      to_port = var.ingress_pvt_app_sg[i].to_port
      protocol = var.ingress_pvt_app_sg[i].protocol
      cidr_block = var.ingress_pvt_app_sg[i].cidr_block
    }
  ]
}


output "ingress_rules_pvt_db_sg" {
  description = "List of ingress rules for the Private DB subnet Security group in the form of Objects"
  value = [
    for i in range(length(var.ingress_pvt_db_sg)) : {
      from_port = var.ingress_pvt_db_sg[i].from_port
      to_port = var.ingress_pvt_db_sg[i].to_port
      protocol = var.ingress_pvt_db_sg[i].protocol
      cidr_block = var.ingress_pvt_db_sg[i].cidr_block
    }
  ]
}
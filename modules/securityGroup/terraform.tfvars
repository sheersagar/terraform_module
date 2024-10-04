ingress_rules_pb_sg = [
  { from_port = 443, to_port = 443, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 465, to_port = 465, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 30000, to_port = 32765, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 3000, to_port = 10000, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 6443, to_port = 6443, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 80, to_port = 80, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 25, to_port = 25, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 27017, to_port = 27017, protocol = "tcp", cidr_block = ["0.0.0.0/0"] },
  { from_port = 22, to_port = 22, protocol = "tcp", cidr_block = ["0.0.0.0/0"] }
]


ingress_rules_lb = [
    {from_port = 80, to_port = 80, protocol = "tcp", cidr_block = [ "0.0.0.0/0" ]},
    {from_port = 443, to_port = 443, protocol = "tcp", cidr_block = [ "0.0.0.0/0" ]}
 ]

ingress_pvt_app_sg = [ 
      {from_port = 2049, to_port = 2049, protocol = "tcp", security_groups = [] }
  ]


ingress_pvt_db_sg = [ 
  {from_port = 3306, to_port = 3306, protocol = "tcp", security_groups = [] }
]
 
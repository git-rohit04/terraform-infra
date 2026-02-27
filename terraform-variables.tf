provider "aws" {
    region = "us-east-1"    
}

resource "aws_security_group" "allow_tls" {
  name        = "please-delete-me"

  tags = {
    Name = "please-delete-me"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn-ip
  from_port         = var.port1
  ip_protocol       = "tcp"
  to_port           = var.port1
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.app-ip
  from_port         = var.port2
  ip_protocol       = "tcp"
  to_port           = var.port2
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

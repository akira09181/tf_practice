resource "aws_network_acl" "monosecom_acl_iot" {
  vpc_id     = aws_vpc.vpc_iot.id
  subnet_ids = aws_subnet.private_subnet_iot_1a.*.id
  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.environment}monosc-nacl-iot-pri-01"
  }
}
resource "aws_network_acl" "monosecom_acl_link_public" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.public_subnet_1a.*.id
  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.environment}monosc-nacl-link-pub"
  }
}
resource "aws_network_acl" "monosecom_acl_link_private_1" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.private_subnet_1a.*.id
  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.environment}monosc-nacl-link-pri-01"
  }
}
resource "aws_network_acl" "monosecom_acl_link_private_2" {
  vpc_id     = aws_vpc.vpc.id
  subnet_ids = aws_subnet.private_subnet4_1a_2.*.id
  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.environment}monosc-nacl-link-pri-02"
  }
}



resource "aws_security_group" "web_sg" {
  name        = "${var.environment}-web-sg"
  description = "web front role security group"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}monosc-web-sg"
    Env  = var.environment
  }
}

resource "aws_security_group_rule" "web_in_http" {
  security_group_id = aws_security_group.web_sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "web_sg_iot" {
  name        = "${var.environment}-web-sg"
  description = "web front role security group"
  vpc_id      = aws_vpc.vpc_iot.id

  tags = {
    Name = "${var.environment}monosc-web-sg_iot"
    Env  = var.environment
  }
}

resource "aws_security_group_rule" "web_iot_in_http" {
  security_group_id = aws_security_group.web_sg_iot.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}
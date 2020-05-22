resource "aws_security_group" "group_open_world" {
  name        = "allow ssh-http-https"
  description = "Allow ssh-http-https inbound traffic and all outbound trafic"
  vpc_id      = "${aws_vpc.UNIRJENKINS.id}"
  tags = {
    Name = "allow ssh-http-https"
  }
}

resource "aws_security_group_rule" "rule_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group_open_world.id}"
}

#seguridad, acepta SSH
resource "aws_security_group_rule" "ssh_rule_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group_open_world.id}"
}

resource "aws_security_group_rule" "tomcat_rule_ingress" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group_open_world.id}"
}


#seguridad, acepta HTTP
resource "aws_security_group_rule" "http_rule_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group_open_world.id}"
}

#seguridad, acepta HTTP
resource "aws_security_group_rule" "https_rule_ingress" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.group_open_world.id}"
}

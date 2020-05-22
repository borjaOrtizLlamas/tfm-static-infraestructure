#vpc for the proyect
resource "aws_vpc" "UNIRJENKINS" {
  cidr_block = "172.16.0.0/24"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "UNIR-VPC-JENKINS"
  }
}

resource "aws_route_table" "routePublic" {
  vpc_id = "${aws_vpc.UNIRJENKINS.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.openWorld.id}"
  }
  tags = {
    Name = "UNIR-RoutePublic"
  }
}

resource "aws_internet_gateway" "openWorld" {
  vpc_id = "${aws_vpc.UNIRJENKINS.id}"
  tags = {
    Name = "UNIR-publicGateway"
  }
}
resource "aws_subnet" "subnetJenkins" {
  vpc_id = "${aws_vpc.UNIRJENKINS.id}"
  cidr_block = "172.16.0.0/24"
  availability_zone = "${var.ZONE_SUB}"
  depends_on = ["aws_internet_gateway.openWorld"]
  map_public_ip_on_launch = true
  tags = {
    Name = "UNIR-SUBNET-JENKINS"
  }
}

resource "aws_route_table_association" "association" {
  subnet_id      = "${aws_subnet.subnetJenkins.id}"
  route_table_id = "${aws_route_table.routePublic.id}"
}


resource "aws_eip" "publicEIP" {
  depends_on = ["aws_internet_gateway.openWorld"]
  vpc = true
  instance = "${aws_instance.jenkins.id}"
}
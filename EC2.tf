resource "aws_instance" "jenkins" {
  ami = "ami-0dea8ccae78a56f9c" #This ami is generated with packer, the code is in this repository: https://github.com/borjaOrtizLlamas/jenkinsAMI.git
  instance_type = "t2.small"
  depends_on = ["aws_internet_gateway.openWorld"]
  availability_zone = "${var.ZONE_SUB}"
  key_name = "${aws_key_pair.jenkinsSSH.key_name}"
  network_interface {
    network_interface_id = "${aws_network_interface.jenkins_interface.id}"
    device_index = 0
  }

  root_block_device{
    volume_size = 8
  }
  
  tags = {
    Name = "JENKINS"
    Environment = "PRO"
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}
resource "aws_network_interface" "jenkins_interface" {
    subnet_id   = "${aws_subnet.subnetJenkins.id}"
    security_groups = ["${aws_security_group.group_open_world.id}"]
    tags = {
        Name = "unir_jenkins_interface"
    }
}
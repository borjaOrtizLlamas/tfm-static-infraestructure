resource "aws_instance" "jenkins" {
  ami = "ami-017ed36bc36f88b86" #This ami is generated with packer, the code is in this repository: https://github.com/borjaOrtizLlamas/jenkinsAMI.git
  instance_type = "t2.micro"
  depends_on = ["aws_internet_gateway.openWorld"]
  availability_zone = "${var.ZONE_SUB}"
  key_name = "${aws_key_pair.jenkinsSSH.key_name}"
  network_interface {
    network_interface_id = "${aws_network_interface.jenkins_interface.id}"
    device_index = 0
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
resource "aws_key_pair" "jenkinsSSH" {
  key_name   = "jenkinsTf"
  public_key = "${var.JENKINS_SSH_KEY}"
}
resource "aws_key_pair" "mongoSSH" {
  key_name   = "mongoSHH"
  public_key = "${var.MONGO_SSH_KEY}"
}

resource "aws_key_pair" "kibanaSSH" {
  key_name   = "kibanaSSH"
  public_key = "${var.KIBANA_SSH_KEY}"
}

resource "aws_key_pair" "jenkinsSSH" {
  key_name   = "jenkinsSSH"
  public_key = "${var.JENKINS_SSH_KEY}"
}
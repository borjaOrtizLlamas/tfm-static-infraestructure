resource "aws_key_pair" "jenkinsSSH" {
  key_name   = "jenkinsSSH"
  public_key = "${var.JENKINS_SSH_KEY}"
}
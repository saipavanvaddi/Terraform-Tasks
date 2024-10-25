resource "aws_instance" "web1" {
  ami           = var.ami_ida
  instance_type = var.instance_type
 # Change this to match your actual subnet IDs
  security_groups = [aws_security_group.web_sg.name]
  key_name = "virkey"
  availability_zone = "us-east-1a"
  tags = {
    Name = "${terraform.workspace}"
  }
}

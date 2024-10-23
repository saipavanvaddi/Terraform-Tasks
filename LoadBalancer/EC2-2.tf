resource "aws_instance" "web2" {
  ami           = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"
  user_data = file("Userdata_EC2-2.sh")
 # Change this to match your actual subnet IDs
  security_groups = [aws_security_group.web_sg.name]
  key_name = "virkey"
  availability_zone = "us-east-1b"
  tags = {
    Name = "EC2-2"
  }
}
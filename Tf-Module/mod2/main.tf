resource "aws_instance" "web2" {
  ami           = "ami-0fff1b9a61dec8a5f"
  instance_type = "t2.micro"
  key_name = "virkey"
  availability_zone = "us-east-1b"
  tags = {
    Name = "EC2-2"
  }
}
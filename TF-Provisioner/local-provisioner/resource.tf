resource "aws_instance" "web-local" {
    ami = "ami-0fff1b9a61dec8a5f"
    instance_type = "t2.micro"
    key_name = "virkey"
    availability_zone = "us-east-1a"
    tags = {
      Name = "file-ec2"
    }
    provisioner "local-exec" {
      command = "touch hello.txt"
    }
}
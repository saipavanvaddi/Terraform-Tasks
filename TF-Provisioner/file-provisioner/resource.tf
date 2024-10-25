resource "aws_instance" "web-file" {
    ami = "ami-0fff1b9a61dec8a5f"
    instance_type = "t2.micro"
    key_name = "virkey"
    availability_zone = "us-east-1a"
    tags = {
      Name = "file-pvr"
    }
    provisioner "file" {
      source = "C:\\Users\\sai\\Desktop\\index.html"
      destination = "/home/ec2-user/index.html"
      connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:\\Users\\sai\\Desktop\\virkey.pem")
      host        = self.public_ip
    }
    }
}
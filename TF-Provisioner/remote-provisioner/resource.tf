resource "aws_instance" "web-remote" {
    ami = "ami-0fff1b9a61dec8a5f"
    instance_type = "t2.micro"
    key_name = "virkey"
    availability_zone = "us-east-1a"
    tags = {
      Name = "remote-pvr"
    }
    provisioner "remote-exec" {
      # inline is user to write multiple commands at a time
      #command is user to write one command at a time
      # script is used to copy single file from local to remote
      # scripts is used to copy multiple files from local to remote
      inline = [ 
        "touch hello.txt",
        "echo hello world remote provisioner >> hello.txt"
       ]
      connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:\\Users\\sai\\Desktop\\virkey.pem")
      host        = self.public_ip
    }
      
    }
}
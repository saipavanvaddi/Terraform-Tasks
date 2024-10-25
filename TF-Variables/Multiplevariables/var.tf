
variable "instance_type" {
  description = "EC2 Instance Type - Instance Sizing"
  type=string
  default="t2.micro"
}
variable "ami_ida" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}
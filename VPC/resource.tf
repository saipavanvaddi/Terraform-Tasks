# Configure AWS provider
provider "aws" {
  region = "us-east-1" # Replace with your desired region
}

# Create VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
}

# Create public subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a" # Replace with your desired availability zone

  tags = {
    "Name" = "public-subnet"
  }
}

# Create private subnet
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b" # Replace with your desired availability zone

  tags = {
    "Name" = "private-subnet"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "example" {
}

# Attach internet gateway to VPC
resource "aws_vpc_attachment" "example" {
  vpc_id = aws_vpc.example.id
  internet_gateway_id = aws_internet_gateway.example.id
}

# Create route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id

  tags = {
    "Name" = "public-route-table"
  }
}

# Create route for public subnet
resource "aws_route" "public" {
  route_table_id     = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.example.id
}

# Associate route table with public subnet
resource "aws_subnet_route_table_association" "public" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Create route table for private subnet
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.example.id

  tags = {
    "Name" = "private-route-table"
  }
}

# Associate route table with private subnet
resource "aws_subnet_route_table_association" "private" {
  subnet_id = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
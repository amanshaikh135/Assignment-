terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_vpc" "this_vpc" {
  cidr_block = var.MY_VPC
}

resource "aws_subnet" "EC2_PUB_SUB01" {
  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.MY_PUB01
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "EC2_PUB_SUB02" {

  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.MY_PUB02
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "EC2_PVT_SUB01" {
  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.MY_PVT01
  availability_zone = "us-east-1b"
}

resource "aws_subnet" "EC2_PVT_SUB02" {
  vpc_id     = aws_vpc.this_vpc.id
  cidr_block = var.MY_PVT02
  availability_zone = "us-east-1a"
}     

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.this_vpc.id

  tags = {
    Name = var.MY_IGW
  }
}


resource "aws_route_table" "my_pub_route" {
  vpc_id = aws_vpc.this_vpc.id

  route {
    cidr_block = var.MY_PUB_ROUTE
    gateway_id = aws_internet_gateway.my_internet_gateway.id
  }

  tags = {
    Name = var.MY_PUB_ROUTETABLE
  }
}

resource "aws_route_table" "my_pvt_route" {
  vpc_id = aws_vpc.this_vpc.id

  route {
    cidr_block = var.MY_PVT_ROUTE
    gateway_id = aws_nat_gateway.my_nat_gw.id
  }

  tags = {
    Name = var.MY_PVT_ROUTETABLE
  }
}

resource "aws_instance" "my_ec2_instance" {
  ami           = var.AMI_ID
  instance_type = var.EC2_TYPE

  tags = {
    Name = var.EC2_INSTANCE
  }
}

resource "aws_eip" "my_eip" {
  domain   = var.MY_VPC_DOMAIN
}

resource "aws_nat_gateway" "my_nat_gw" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.EC2_PUB_SUB01.id

  tags = {
    Name = var.MY_NAT_GW
  }
  depends_on = [aws_internet_gateway.my_internet_gateway]
}

resource "aws_route_table_association" "my_routetable_pub" {
  subnet_id      = aws_subnet.EC2_PUB_SUB01.id
  route_table_id = aws_route_table.my_pub_route.id
}

resource "aws_route_table_association" "my_routetable_public" {
  subnet_id      = aws_subnet.EC2_PUB_SUB02.id
  route_table_id = aws_route_table.my_pub_route.id
}

resource "aws_route_table_association" "my_routetable_pvt" {
  subnet_id      = aws_subnet.EC2_PVT_SUB01.id
  route_table_id = aws_route_table.my_pub_route.id
}

resource "aws_route_table_association" "my_routetable_private" {
  subnet_id      = aws_subnet.EC2_PVT_SUB02.id
  route_table_id = aws_route_table.my_pub_route.id
}
				
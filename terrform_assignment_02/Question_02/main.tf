terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "this_ec2_instance" {
  ami           = var.EC2_AMI
  instance_type = var.TMIC

  tags = {
    Name = var.EC2_TAGS
  }
}

resource "aws_eip" "this_eip" {
  instance = aws_instance.this_ec2_instance.id
  domain   = var.VP
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.this_ec2_instance.id
  allocation_id = aws_eip.this_eip.id
}

output "EC2_PUB_DNS" {
  value = aws_instance.this_ec2_instance.public_dns
}

output "EC2_PVT_DNS" {
  value = aws_instance.this_ec2_instance.private_dns
}

output "EC2_PUB_IP" {
  value = aws_instance.this_ec2_instance.public_ip
}

output "EC2_PVT_IP" {
  value = aws_instance.this_ec2_instance.private_ip
}
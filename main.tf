terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "this" {
  ami                     = "ami-0a3c3a20c09d6f377"
  instance_type           = var.EC2_MICRO
}

resource "aws_key_pair" "deployer" {
  key_name   = "terrapub-key"
  public_key = var.EC2_TERRAFORMPUB
  }

  resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = var.EC2_SG


  tags = {
    Name = "allow_tls"
  }


 ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.EC2_PORT]
  }


 egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.EC2_PORT]
  }
}


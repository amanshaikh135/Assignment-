terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "aws_instance" "devops" {
  ami           = var.EC2_AMI
  instance_type = var.EC2_TYPE 

  tags = {
    Name = var.EC2_TAGS
  }
}
resource "aws_ami_from_instance" "terraform_ami" {
  name               = var.EC2_AMI_CLOUD
  source_instance_id = aws_instance.devops.id
}
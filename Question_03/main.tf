terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.35.0"
    }
  }
}

provider "aws" {}

resource "aws_instance" "devops" {
  ami           = var.EC2_AMI
  instance_type = var.EC2_TYPE 

  tags = {
    Name = var.EC2_TAGS
  }
}

data "aws_instance" "data_devops" {
  instance_id = aws_instance.devops.id
}

resource "aws_ami_from_instance" "terraform_ami" {
  name               = var.EC2_AMI_CLOUD
  source_instance_id = data.aws_instance.data_devops.id
}


resource "aws_instance" "web" {
  ami           = aws_ami_from_instance.terraform_ami.id
  instance_type = var.EC2_TYPE
  depends_on = [aws_ami_from_instance.terraform_ami]

  tags = {
    Name = var.EC2_INSTANCE
  }
}





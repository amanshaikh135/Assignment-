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

resource "aws_iam_user" "ce" {
  name = var.CUDTHX
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_group" "do" {
  name = var.DVOS
  path = "/users/"
}
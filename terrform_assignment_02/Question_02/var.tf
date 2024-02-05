
variable "TMIC" {
  type    = string
  default = "t2.micro"
}


variable "VP" {
  type    = string
  default = "vpc"
}

variable "EC2_TAGS" {
  type    = string
  default = "HelloWorld"
}

variable "EC2_AMI" {
  type    = string
  default = "ami-0a3c3a20c09d6f377"
}

variable "MY_VPC" {
  type    = string
 
}


variable "MY_PUB01" {
  type    = string

}

variable "MY_PUB02" {
  type    = string
  
}

variable "MY_PVT01" {
  type    = string

}

variable "MY_PVT02" {
  type    = string
 
}

variable "MY_IGW" {
  type    = string
 
}

variable "MY_PUB_ROUTE" {
  type    = string

}

variable "MY_PUB_ROUTETABLE" {
  type    = string
 
}

variable "MY_PVT_ROUTE" {
  type    = string
 
}

variable "MY_PVT_ROUTETABLE" {
  type    = string
  
}

variable "EC2_TYPE" {
  type    = string
  
}

variable "AMI_ID" {
  type    = string
  
}

variable "EC2_INSTANCE" {
  type    = string

}

variable "MY_VPC_DOMAIN" {
  type    = string
 
}

variable "MY_NAT_GW" {
  type    = string
  
}

variable "TF_KEY" {
  type    = string
}
variable "SSH_PUB_KEY" {
  type    = string
}
variable "AWS_SG" {
  type    = string
}
variable "EC2_SG" {
  type    = string
}
variable "INGRESS_TCP" {
  type    = string   
}

variable "INGRESS_CIDR" {
  type    = string   
}

variable "EGRESS_TCP" {
  type    = string   
}

variable "EGRESS_CIDR" {
  type    = string   
}



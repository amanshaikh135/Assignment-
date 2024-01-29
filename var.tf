#EC2 INSTANCE

variable "EC2_TERRAFORMPUB" {
type = string
default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCNHa9uQVtRRjNX9KsFAXew9Qi2pSeiP9+4MxVDHY2wByZiDIImRAJV9t6Bx4in1ZuEQiropbc/jRCxIfDJOHk0kg0Eqb5S0DN543m88p5FNYT7/oNMUmFV4hjYZFy07REPTdUWIt1lWthRw8EdWluRiLy4k+skPAc5T3Gh932+df3okJTNtI2G1jINpv17c6EPZnxP3m8mVQ+5jnRTOL3Ln74odvz2gPf/5ujXFyzbjnFC/u6Sy7+KqiUFabw5jLtxMB9kTfrLPkSTRh5vmH1xX2gQYycmIdF5b1ITZy+4p4FvGJcHZmNfJo3cTU0OwZ/9yxrT/UPWJghhuU7NlF2oOIvbkz4Rp5VSJh01v54JcEvwyQqixnQd4iDfCilBoKHAf/Pjo1NOGDLpNtfawg7fEa8RWzT/OYLSmI2k0Zkw8cEU6/GzSQPeHgtzenLrIFuOM+W/XJHVgSUrMVvhy6yw6wvK+gkdqV9RVrf9ZPGCdeLas3J29YLqKqJBGfCi24c= root@DESKTOP-THNIIG3"
}

variable "EC2_MICRO" {
type = string
default = "t2.micro"
}

variable "EC2_SG" {
type = string
default = "Allow TLS inbound traffic and all outbound traffic"
}
 
variable EC2_PORT {
type = string
default = "0.0.0.0/0"
}


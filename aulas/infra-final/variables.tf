variable "region" {
  type    = string
  default = "us-east-2"

}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}

variable "subnet_cidr_block_a" {
  type    = string
  default = "10.0.1.0/24"

}

variable "subnet_cidr_block_b" {
  type    = string
  default = "10.0.2.0/24"

}



variable "aws_route_table_cidr_block" {
  type    = string
  default = "0.0.0.0/0"

}

variable "az_a" {
  type    = string
  default = "us-east-2a"

}

variable "az_b" {
  type    = string
  default = "us-east-2b"

}


variable "map_public_ip_on_launch" {
  type    = bool
  default = true

}

variable "nome" {
  type    = string
  default = "533curso"

}

variable "porta_http" {
  type    = number
  default = 80

}

variable "porta_https" {
  type    = number
  default = 443

}
variable "porta_ssh" {
  type    = number
  default = 22

}

variable "cidr_qualquer_rede" {
  type    = string
  default = "0.0.0.0/0"

}

variable "instance_type" {
    type = string
    default = "t3-micro"
  
}
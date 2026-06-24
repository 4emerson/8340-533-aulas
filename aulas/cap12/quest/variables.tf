variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}

variable "subnet_cidr_block" {
  type    = string
  default = "10.0.1.0/24"

}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true

}

variable "portas" {
  type    = list(number)
  default = [22, 80]
}


variable "ami" {
  type    = string
  default = "ami-0e68dc81dc36750a1"

}

variable "instance_type" {
  type    = string
  default = "t3.small"

}
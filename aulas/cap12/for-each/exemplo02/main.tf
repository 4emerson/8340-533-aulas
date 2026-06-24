provider "aws" {
  region = "us-east-2"
}


variable "instancias" {
  type = map(string)
  default = {
    "dev" = "t3.small"
    "stg" = "t3.micro"
    "prd" = "t3.large"
  }

}

resource "aws_instance" "this" {
  for_each = var.instancias


  ami           = "ami-0e68dc81dc36750a1"
  instance_type = each.value
  tags = {
    Name        = each.key
    Environment = each.key
  }

}


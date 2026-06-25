# data "terraform_remote_state" "quest-aula" {
#   backend = "s3"

#   config = {
#     bucket = "tf-backend-curso533"
#     key = "quest-aula/terraform.tfstate"
#     region = "us-east-2"
#   }
  
# }

provider "aws" {
  region = "us-east-2"
  
}

terraform {
  backend "s3" {
    bucket = "tf-backend-curso533"
    key = "quest-aula/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "tf-state-lock"
    encrypt = true
    
  }
}


locals {

  quantidade = terraform.workspace == "prd" ? 5 : terraform.workspace == "stg" ? 2 : 1

}


resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = format("%s-vpc", terraform.workspace)
    Environment = terraform.workspace
  }

}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = format("%s-subnet", terraform.workspace)
    Environment = terraform.workspace
  }

}

resource "aws_security_group" "this" {
  name   = format("%s-sg", terraform.workspace)
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = var.portas[0]
    to_port     = var.portas[0]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.portas[1]
    to_port     = var.portas[1]
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "this" {
  count                  = local.quantidade
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.this.id
  vpc_security_group_ids = [aws_security_group.this.id]


  tags = {
    Name        = format("%s-instancia-%d", terraform.workspace, count.index)
    Environment = terraform.workspace
  }

}
locals {
  config = {
    dev = { instance_type = "t3.small", quantidade = 1 }
    prd = { instance_type = "t3.micro", quantidade = 3 }
  }

  atual = lookup(local.config, terraform.workspace)
}

resource "aws_vpc" "this" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = format("%s-vpc", terraform.workspace)
    Environment = terraform.workspace
  }

}

resource "aws_subnet" "this" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name        = format("%s-subnet", terraform.workspace)
    Environment = terraform.workspace
  }
}

resource "aws_instance" "this" {
  count = local.atual.quantidade

  ami           = "ami-0e68dc81dc36750a1"
  instance_type = local.atual.instance_type
  subnet_id     = aws_subnet.this.id
  tags = {
    Name        = format("%s-instancia-%d", terraform.workspace, count.index)
    Environment = terraform.workspace
  }
}
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name        = format("%s-vpc-%s", var.nome, terraform.workspace)
    Environment = terraform.workspace
  }

}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name        = format("%s-igw-%s", var.nome, terraform.workspace)
    Environment = terraform.workspace
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr_block_a
  availability_zone       = var.az_a
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = format("%s-subnet-a-%s", var.nome, terraform.workspace)
    Environment = terraform.workspace
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr_block_b
  availability_zone       = var.az_a
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name        = format("%s-subnet-b-%s", var.nome, terraform.workspace)
    Environment = terraform.workspace
  }
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = var.aws_route_table_cidr_block
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name        = format("%s-rt-%s", var.nome, terraform.workspace)
    Environment = terraform.workspace
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.this.id

}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.this.id

}
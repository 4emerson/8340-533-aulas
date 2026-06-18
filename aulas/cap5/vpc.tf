resource "aws_vpc" "minha-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "minha-vpc"
  }

}

resource "aws_subnet" "minha-subnet" {
  vpc_id     = aws_vpc.minha-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "minha-subnet"
  }
}
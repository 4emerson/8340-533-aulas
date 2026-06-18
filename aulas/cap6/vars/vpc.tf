resource "aws_vpc" "ex-vars" {
    cidr_block = var.cidr_block_vpc
    tags = {
        Name = "ex-vars"
    }
}

resource "aws_subnet" "ex-vars" {
    vpc_id = aws_vpc.ex-vars.id
    cidr_block = var.cidr_block_subnet
  
}
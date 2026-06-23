resource "aws_vpc" "this" {

  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = format("%s-vpc", terraform.workspace)
    Environment = terraform.workspace
  }
}

resource "aws_subnet" "this" {
  vpc_id                  = aws_vpc.this.id
  depends_on              = [aws_vpc.this]
  cidr_block              = "10.0.1.0/24"
  availability_zone       = terraform.workspace == "prd" ? "us-east-2a" : "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name        = format("%s-subnet", terraform.workspace)
    Environment = terraform.workspace
  }

}

resource "aws_security_group" "this" {
  name   = format("%s-sg", terraform.workspace)
  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 22
    to_port     = 22
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
  count                  = terraform.workspace == "prd" ? 6 : 3
  ami                    = "ami-0e68dc81dc36750a1"
  instance_type          = terraform.workspace == "prd" ? "t3.micro" : "t3.small"
  availability_zone      = terraform.workspace == "prd" ? "us-east-2a" : "us-east-2b"
  subnet_id              = aws_subnet.this.id
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = {
    Name        = format("%s-instancia-%d", terraform.workspace, count.index +1)
    Environment = terraform.workspace
  }

}
resource "aws_instance" "primeira_ec2" {
  ami           = "ami-0e68dc81dc36750a1"
  instance_type = "t3.small"
  tags = {
    Name = "vm-01"
  }

}


resource "aws_instance" "segunda_ec2" {
  ami           = "ami-0e68dc81dc36750a1"
  instance_type = "t3.small"
  tags = {
    Name = "vm-02"
  }

}

resource "aws_instance" "terceira_ec2" {
  ami           = "ami-0e68dc81dc36750a1"
  instance_type = "t3.small"
  tags = {
    Name = "vm-03"
  }

}

resource "aws_instance" "quarta_ec2" {
  ami           = "ami-0e68dc81dc36750a1"
  instance_type = "t3.small"
  tags = {
    Name = "vm-04"
  }

}
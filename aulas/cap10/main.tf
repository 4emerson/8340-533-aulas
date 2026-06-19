module "network" {
  source = "./aws-network"

  name = "tf-cap10-modulo"
  cidr = "10.0.0.0/16"
}

module "instance" {
  source = "./aws-instance"

  name = "vm-cap10-modulo"
  instance_type = "t3.micro"
  ami = "ami-0e68dc81dc36750a1"
  
}
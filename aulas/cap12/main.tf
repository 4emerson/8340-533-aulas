module "network" {
  source = "git::https://gitlab.com/terraform-modules5763025/aws-network.git?ref=v1.4"

  name = format("%s-%s", terraform.workspace, "vpc-cap12")
  cidr = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
 

}

module "instance" {
  source = "git::https://oauth2:TOKEN@gitlab.com/terraform-modules5763025/aws-instance.git?ref=v1.4"

  name          = format("%s-%s", terraform.workspace, "ec2-cap12")
  instance_type = "t3.micro"
  ami           = "ami-0e68dc81dc36750a1"
  subnet_id     = module.network.subnet_id
  vpc_id        = module.network.vpc_id
}


output "id" {
  value = module.network.vpc_id
}
output "public_ip" {
  value = module.instance.public_ip
  
}

